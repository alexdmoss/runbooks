#!/usr/bin/env bash
set -euoE pipefail

if [[ -z ${GCP_PROJECT_ID:-} ]]; then echo "GCP Project not set"; exit 1; fi
if [[ -z ${HOSTNAME:-} ]]; then echo "Hostname not set"; exit 1; fi

function main() {

    pushd "$(dirname "${BASH_SOURCE[0]}")/app" >/dev/null

    echo "-> [INFO] Building runbooks site ..."

    mkdir -p ../app/www
    cd src/ && hugo --source .

    echo "-> [INFO] Checking expected HTML files rendered ..." 

    markdown_files=$(find content -type f -name '*.md')

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

    popd >/dev/null

}

main "${@:-}"
