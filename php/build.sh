#!/bin/bash

set -e

SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
cd "${SCRIPT_DIR}"

platforms='linux/amd64,linux/arm64'

if ! docker buildx inspect multi-platforms >/dev/null 2>&1; then
    docker buildx create --name multi-platforms --driver docker-container --bootstrap
fi

for version in 8.4 8.5; do
    docker buildx build \
        -f ./Dockerfile \
        --build-arg "PHP_VERSION=${version}" \
        -t "kikikanri/php:${version}-fpm-trixie" \
        --builder multi-platforms \
        --cache-from 'type=registry,ref=kikikanri/php:build-cache-8.4-fpm-trixie' \
        --cache-from 'type=registry,ref=kikikanri/php:build-cache-8.5-fpm-trixie' \
        --cache-to "type=registry,ref=kikikanri/php:build-cache-${version}-fpm-trixie,mode=max" \
        --platform "${platforms}" \
        --pull \
        --push \
        .
done
