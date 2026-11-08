#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
cd "${SCRIPT_DIR}"

docker buildx build \
    -f ./Dockerfile \
    -t 'kikikanri/wordpress:6.9-php8.5-fpm-alpine' \
    --load \
    --no-cache \
    --platform linux/amd64 \
    --pull \
    .
