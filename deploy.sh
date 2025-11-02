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
    
    echo "-> [DEBUG] Checking deployment package size..."
    total_size=$(du -sh . | cut -f1)
    file_count=$(find . -type f | wc -l)
    echo "-> [DEBUG] Total size: $total_size, File count: $file_count"
    
    echo "-> [DEBUG] Checking for files over 32MB (App Engine limit)..."
    find . -type f -size +32M -exec ls -lh {} \; | head -10
    
    echo "-> [DEBUG] Validating app.yaml syntax..."
    cat app.yaml
    
    echo "-> [DEBUG] Checking if .gcloudignore exists..."
    if [[ -f ".gcloudignore" ]]; then
        echo "-> [DEBUG] .gcloudignore contents:"
        cat .gcloudignore
    else
        echo "-> [DEBUG] No .gcloudignore file found"
    fi

    echo "-> [INFO] Deploying runbooks site ..."
    gcloud app deploy --project "${APP_ENGINE_PROJECT_ID}" --verbosity=debug
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

    # weak basic test - not great for brand new sites in AppEngine - ~10-15 mins for new SSL certs to be issued and usable
    echo "Checking HTTP status code for https://${HOSTNAME}/ ..."

    response_code=$(curl -sSLk -o /dev/null -w "%{http_code}" https://"${HOSTNAME}"/)

    if [[ ${response_code:0:1} == "4" ]] || [[ ${response_code:0:1} == "5" ]]; then
        echo "-> [ERROR] Test FAILED - HTTP response code was ${response_code}"
        exit 1
    else 
        echo "-> [INFO] Test PASSED - HTTP response code was ${response_code}"
    fi
    
}

main "${@:-}"
