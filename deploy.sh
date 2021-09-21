#!/usr/bin/env bash
set -euoE pipefail

if [[ -z ${GCP_PROJECT_ID:-} ]]; then echo "GCP Project not set"; exit 1; fi
if [[ -z ${HOSTNAME:-} ]]; then echo "Hostname not set"; exit 1; fi

function main() {

    pushd "$(dirname "${BASH_SOURCE[0]}")/app" >/dev/null

    echo "-> [INFO] Deploying runbooks site ..."
    gcloud app deploy --project "${GCP_PROJECT_ID}" --quiet
    echo "-> [INFO] Deployment complete"

    # this is only ok because this is the only AppEngine site in this project
    echo "-> [INFO] Deploying dispatch rules ..."
    gcloud app deploy dispatch.yaml --project="${GCP_PROJECT_ID}" --quiet
    echo "-> [INFO] Deployment complete"

    echo "-> [INFO] Mapping custom domain"
    gcloud app domain-mappings create runbooks.alexos.dev --project="${GCP_PROJECT_ID}"

    popd >/dev/null

    # weak basic test - not great for brand new sites in AppEngine - ~10-15 mins for new SSL certs to be issued and usable
    echo "Checking HTTP status code for https://${HOSTNAME}/ ..."

    response_code=$(curl -k -L -o /dev/null -w "%{http_code}" https://"${HOSTNAME}"/)

    if [[ ${response_code:0:1} == "4" ]] || [[ ${response_code:0:1} == "5" ]]; then
        echo "-> [ERROR] Test FAILED - HTTP response code was ${response_code}"
        exit 1
    else 
        echo "-> [INFO] Test PASSED - HTTP response code was ${response_code}"
    fi
    
}

main "${@:-}"
