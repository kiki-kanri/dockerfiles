#!/bin/bash

set -e

SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
cd "$SCRIPT_DIR"

platforms='linux/amd64,linux/arm64'
declare -A python_versions=(
    ["3.11"]="3.11.11"
    ["3.12"]="3.12.9"
    ["3.13"]="3.13.2"
)

types=(
    'alpine'
    'alpine-gcc'
    'slim'
    'slim-gcc'
)

for major_python_version in "${!python_versions[@]}"; do
    full_python_version="${python_versions[$major_python_version]}"
    docker pull "python:$full_python_version-alpine" &
    docker pull "python:$full_python_version-slim" &
    wait
    for type in "${types[@]}"; do
        image_tag="kikikanri/python:$major_python_version-$type"
        docker buildx build \
            -f ./"$type" \
            -t "$image_tag" \
            --build-arg FULL_PYTHON_VERSION="$full_python_version" \
            --build-arg IMAGE_TYPE="$type" \
            --build-arg MAJOR_PYTHON_VERSION="$major_python_version" \
            --builder multi-platform \
            --no-cache \
            --platform "$platforms" \
            --push .
    done
done
