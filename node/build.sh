#!/bin/bash

set -e
cd "$(dirname "$(readlink -f "$0")")"

node_versions=(
    '22'
    '24'
)

platforms='linux/amd64,linux/arm64'
types=(
    'alpine'
    'slim'
)

for node_version in "${node_versions[@]}"; do
    for type in "${types[@]}"; do
        image_tag="kikikanri/node:$node_version-$type"
        node_tag="$node_version-$type"
        docker pull "node:$node_tag"
        docker buildx build \
            -f ./"$type" \
            -t "$image_tag" \
            --build-arg NODE_TAG="$node_tag" \
            --builder multi-platform \
            --no-cache \
            --platform "$platforms" \
            --push .
    done
done
