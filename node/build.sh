#!/bin/bash

set -e
platforms="linux/amd64,linux/arm64"
node_versions=(
    '20'
    '22'
)

type=(
    'alpine'
    'slim'
)

for node_version in "${node_versions[@]}"; do
    for type in "${type[@]}"; do
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
