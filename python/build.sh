#!/bin/bash

declare -A versions=(
	["3.11"]="3.11.9"
	["3.12"]="3.12.4"
)

for PY_VERSION in "${!versions[@]}"; do
	FULL_PY_VERSION=${versions[$PY_VERSION]}
	BUILD_ARGS="--build-arg FULL_PY_VERSION=$FULL_PY_VERSION --build-arg PY_VERSION=$PY_VERSION --platform linux/amd64,linux/arm64 --push"

	# Base alpine
	tag="kikikanri/python$PY_VERSION:base-alpine"
	docker pull python:$FULL_PY_VERSION-alpine &&
		docker buildx build -f ./base-alpine -t $tag $BUILD_ARGS . || exit 1

	# Base alpine gcc
	tag="kikikanri/python$PY_VERSION:base-alpine-gcc"
	docker pull kikikanri/python$PY_VERSION:base-alpine &&
		docker buildx build -f ./base-alpine-gcc -t $tag $BUILD_ARGS . || exit 1

	# Base slim
	tag="kikikanri/python$PY_VERSION:base-slim"
	docker pull python:$FULL_PY_VERSION-slim &&
		docker buildx build -f ./base-slim -t $tag $BUILD_ARGS . || exit 1
done
