#!/usr/bin/env bash
set -euoE pipefail

if [[ -z ${PROJECT_ID:-} ]]; then echo "GCP Project not set"; exit 1; fi
if [[ -z ${SERVICE:-} ]]; then echo "Cloud Run Service not set"; exit 1; fi
if [[ -z ${CI_COMMIT_SHA:-} ]]; then CI_COMMIT_SHA="local"; exit 1; fi

function main() {


    echo "-> [INFO] Building runbooks site ..."

    pushd "$(dirname "${BASH_SOURCE[0]}")/src" >/dev/null
    mkdir -p ../app/www
    hugo --source .
    popd >/dev/null
    
    echo "-> [INFO] Checking expected HTML files rendered ..." 

    pushd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null
    
    markdown_files=$(find content -type f -name '*.md')
    error=0
    
    for md_file in ${markdown_files}; do

        html_path=$(dirname "${md_file}" | sed 's#^content#app/www#')

        if [[ $(basename "${md_file}") == "_index.md" ]]; then
            html_file="index.html"
        else
            html_file=$(basename "${md_file}" | sed 's#\.md$#/index.html#')
        fi

        test_file=$(echo "${html_path}"/"${html_file}" | awk '{print tolower($0)}')
        if [[ ! -f "${test_file}" ]]; then
            error=1
            echo "-> [ERROR] Expected HTML file was missing. Markdown: ${md_file} should be assembled into: ${test_file}"
        fi

    done

    if [[ "${error}" != "0" ]]; then
        echo "-> [ERROR] Tests FAILED - see messages above for for detail"
        exit 1
    else
        echo "-> [INFO] All tests passed!"
    fi

    echo "-> [INFO] Baking docker image ..."

    image_name="eu.gcr.io/${PROJECT_ID}/${SERVICE}"
    docker build --tag "${image_name}":"${CI_COMMIT_SHA}" .

    if [[ ${CI_SERVER:-} == "yes" ]]; then
        echo "-> [INFO] Pushing to registry ..."
        docker push "${image_name}":"${CI_COMMIT_SHA}"
    fi

    popd >/dev/null

}

main "${@:-}"
