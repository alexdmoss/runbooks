#!/usr/bin/env bash
set -euoE pipefail

if [[ -z ${PROJECT_ID:-} ]]; then echo "GCP Project not set"; exit 1; fi
if [[ -z ${DOMAIN:-} ]]; then echo "Domain not set"; exit 1; fi
if [[ -z ${SERVICE:-} ]]; then echo "Cloud Run Service not set"; exit 1; fi
if [[ -z ${REGION:-} ]]; then echo "Cloud Run Region not set"; exit 1; fi
if [[ -z ${PORT:-} ]]; then echo "Container Port not set"; exit 1; fi

function main() {

    echo "-> [INFO] Deploying runbooks site ..."

    gcloud run deploy "${SERVICE}" \
        --image "eu.gcr.io/${PROJECT_ID}/${SERVICE}":"${CI_COMMIT_SHA}" \
        --project "${PROJECT_ID}" \
        --platform managed \
        --region "${REGION}"  \
        --service-account run-"${SERVICE}"@"${PROJECT_ID}".iam.gserviceaccount.com \
        --port "${PORT}" \
        --min-instances 1 \
        --max-instances 2 \
        --allow-unauthenticated

    echo "-> [INFO] Deployment complete"
    
    popd >/dev/null

    # weak basic test - not great for brand new sites in AppEngine - ~10-15 mins for new SSL certs to be issued and usable
    echo "Checking HTTP status code for https://${DOMAIN}/ ..."

    response_code=$(curl -sSLk -o /dev/null -w "%{http_code}" https://"${DOMAIN}"/)

    if [[ ${response_code:0:1} == "4" ]] || [[ ${response_code:0:1} == "5" ]]; then
        echo "-> [ERROR] Test FAILED - HTTP response code was ${response_code}"
        exit 1
    else 
        echo "-> [INFO] Test PASSED - HTTP response code was ${response_code}"
    fi
    
}

main "${@:-}"
