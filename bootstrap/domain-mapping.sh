#!/usr/bin/env bash
set -euoE pipefail

# PROJECT_ID must also be set
export SERVICE=runbooks
export DOMAIN=runbooks.alexos.dev
export REGION=europe-west1

echo "-> [INFO] Creating domain-mapping for ${DOMAIN} ..."
gcloud beta run domain-mappings create \
  --service "${SERVICE}" \
  --domain "${DOMAIN}" \
  --platform managed \
  --region "${REGION}" \
  --project "${PROJECT_ID}"
