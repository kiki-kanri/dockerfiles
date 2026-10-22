#!/bin/bash

set -e

SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
cd "${SCRIPT_DIR}"

platforms='linux/amd64,linux/arm64'

if ! docker buildx inspect multi-platforms > /dev/null 2>&1; then
    docker buildx create --name multi-platforms --driver docker-container --bootstrap
fi
 
docker pull php:8.4-fpm-trixie
docker buildx build \
    -f ./8.4-fpm-trixie \
    -t 'kikikanri/php:8.4-fpm-trixie' \
    --builder multi-platforms \
    --no-cache \
    --platform "${platforms}" \
    --push .

docker pull php:8.5-fpm-trixie
docker buildx build \
    -f ./8.5-fpm-trixie \
    -t 'kikikanri/php:8.5-fpm-trixie' \
    --builder multi-platforms \
    --no-cache \
    --platform "${platforms}" \
    --push .
