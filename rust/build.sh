#!/bin/bash

set -e

SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
cd "${SCRIPT_DIR}"

docker pull rust:slim-bookworm
docker buildx build \
    -f ./slim-bookworm \
    -t 'kikikanri/rust:slim-bookworm' \
    --no-cache \
    --push .
