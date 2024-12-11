#!/bin/bash

set -e
platforms="linux/amd64,linux/arm64"
declare -A versions=(
    ["20"]="20"
    ["22"]="22"
)

for NODE_VERSION in "${!versions[@]}"; do
    # Base alpine
    node_image=node:${versions[$NODE_VERSION]}-alpine
    tag="kikikanri/node$NODE_VERSION:base-alpine"
    docker pull $node_image
    docker buildx build \
        -f ./base-alpine \
        -t $tag \
        --build-arg NODE_IMAGE=$node_image \
        --builder multi-platform \
        --platform $platforms \
        --push .

    # Base alpine puppeteer
    base_image="kikikanri/node$NODE_VERSION:base-alpine"
    tag="kikikanri/node$NODE_VERSION:puppeteer"
    docker pull $base_image
    docker buildx build \
        -f ./puppeteer \
        -t $tag \
        --build-arg BASE_IMAGE=$base_image \
        --builder multi-platform \
        --platform $platforms \
        --push .
done
