#!/bin/bash

set -e

SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
cd "${SCRIPT_DIR}"

platforms='linux/amd64,linux/arm64'

docker pull php:8.4-fpm-bookworm
docker buildx build \
    -f ./8.4-fpm-bookworm \
    -t 'kikikanri/php:8.4-fpm-bookworm' \
    --builder multi-platform \
    --no-cache \
    --platform "${platforms}" \
    --push .
