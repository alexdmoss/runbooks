#!/usr/bin/env bash
#
# Post-deploy smoke test for the runbooks site on App Engine.
#
# Each check: URL, expected status, a phrase that only appears when the page
# really rendered, and a description. Redirect checks (30x) match the phrase
# against the Location header instead of the body.
#
# TLS is checked without -k: a load balancer serving the wrong certificate
# must fail the smoke test (see our-shows for how that slipped through once).

set -uo pipefail

HOST="${SMOKE_HOST:-https://${DOMAIN:?DOMAIN must be set}}"

error=0

function main() {

  echo "-> [INFO] Running smoke tests against ${HOST} ..."

  _check "${HOST}/"                                  "200" "<title>Runbooks :: Runbooks"          "Home page"
  _check "${HOST}/application-1/"                    "200" "<title>Application #1 :: Runbooks"    "Section page"
  _check "${HOST}/application-2/alerts/5xx-errors/"  "200" "slo-application-2.prod-browse.5xx"    "Nested runbook page"
  _check "${HOST}/index.json"                        "200" '"uri": "/application-3/'               "Search index"
  _check "${HOST}/css/style.css"                     "200" "@import \"/css/_core.css\""        "Stylesheet"
  _check "${HOST}/does-not-exist/"                   "404" "404"                                  "Missing page is a 404"

  echo

  if [[ "${error}" != "0" ]]; then
    echo "-> [ERROR] Tests FAILED - see messages above for detail"
    exit 1
  fi

  echo "-> [INFO] All tests passed!"

}

function _check() {

  local url=$1
  local expected_rc=$2
  local match=$3
  local description=$4
  local output actual_rc rc

  echo

  if [[ ${expected_rc} == 30? ]]; then
    # GET rather than -I: some apps (FastAPI) answer HEAD with 405
    output=$(curl -s -o /dev/null -D - --max-time 10 "${url}")
    rc=$?
    actual_rc=$(echo "${output}" | grep 'HTTP/' | head -n1 | awk '{print $2}')
    match_against=$(echo "${output}" | grep -i '^location:')
  else
    output=$(curl -s -L --compressed --max-time 10 -w "\n%{http_code}" "${url}")
    rc=$?
    actual_rc=$(echo "${output}" | tail -n1)
    match_against=${output}
  fi

  if [[ ${rc} -eq 60 ]]; then
    echo "-> [ERROR] Test FAILED - ${description} ::: ${url} - TLS certificate not valid for this host"
    error=1
    return
  fi

  if [[ "${actual_rc}" != "${expected_rc}" ]]; then
    echo "-> [ERROR] Test FAILED - ${description} ::: ${url} - expected ${expected_rc}, received ${actual_rc:-nothing (curl exit ${rc})}"
    error=1
    return
  fi

  if ! grep -qF -- "${match}" <<< "${match_against}"; then
    echo "-> [ERROR] Test FAILED - ${description} ::: ${url} - missing phrase (expected ${match})"
    error=1
    return
  fi

  echo "-> [INFO] Test PASSED - ${description} ::: ${url}"

}

main "$@"
