#!/usr/bin/env bash
set -euoE pipefail

function main() {
    pushd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null
    run_hugo server -wDs src/
    popd >/dev/null
}

function run_hugo() {
    if ! [ -x "$(command -v hugo)" ]; then
        docker run --rm -t "$(tty &>/dev/null && echo "-i")" -v "$(pwd)":/src -p 1313:1313 klakegg/hugo:0.83.1-ext-alpine "$@"
    else
        hugo "$@"
    fi
}

main
