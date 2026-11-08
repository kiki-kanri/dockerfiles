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
        --platform "${platforms}" \
        --pull \
        --push \
        .
done
