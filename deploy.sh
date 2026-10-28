#!/usr/bin/env bash
set -euoE pipefail

if [[ -z ${APP_ENGINE_PROJECT_ID:-} ]]; then echo "GCP Project not set"; exit 1; fi
if [[ -z ${HOSTNAME:-} ]]; then echo "Hostname not set"; exit 1; fi

function main() {

    pushd "$(dirname "${BASH_SOURCE[0]}")/app" >/dev/null

    if [[ ! -d "www" ]]; then
        echo "-> [ERROR] www/ directory not found. Did you run build.sh first?"
        exit 1
    fi

    echo "-> [INFO] Deploying runbooks site ..."
    gcloud app deploy --project "${APP_ENGINE_PROJECT_ID}"
    echo "-> [INFO] Deployment complete"

    # this is only ok because this is the only AppEngine site in this project
    echo "-> [INFO] Deploying dispatch rules ..."
    gcloud app deploy dispatch.yaml --project="${APP_ENGINE_PROJECT_ID}" --quiet
    echo "-> [INFO] Deployment complete"

    if [[ $(gcloud app domain-mappings list --project="${APP_ENGINE_PROJECT_ID}" --format='value(id)' --filter=ID="${HOSTNAME}" | wc -l) -eq 0 ]]; then
        echo "-> [INFO] Mapping custom domain"
        curl -sSL --request POST \
            "https://appengine.googleapis.com/v1/apps/${APP_ENGINE_PROJECT_ID}/domainMappings?overrideStrategy=OVERRIDE" \
            --header "Authorization: Bearer $(gcloud auth print-access-token)" \
            --header "Accept: application/json" \
            --header "Content-Type: application/json" \
            --data '{"id":"runbooks.alexos.dev"}' \
            --compressed
    fi

    popd >/dev/null

}

main "${@:-}"
