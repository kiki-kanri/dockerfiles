#!/bin/bash

set -e

SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
cd "${SCRIPT_DIR}"

platforms='linux/amd64,linux/arm64'
types=(
    'alpine'
    'slim'
)

for type in "${types[@]}"; do
    image_tag="kikikanri/bun:${type}"
    bun_tag="${type}"
    docker pull "oven/bun:${bun_tag}"
    docker buildx build \
        -f ./"${type}" \
        -t "${image_tag}" \
        --build-arg BUN_TAG="${bun_tag}" \
        --builder multi-platform \
        --no-cache \
        --platform "${platforms}" \
        --push .
done
