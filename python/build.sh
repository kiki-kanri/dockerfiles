#!/bin/bash

declare -A versions=(
	["3.11"]="3.11.7"
	["3.12"]="3.12.0"
)

for PY_VERSION in "${!versions[@]}"; do
	FULL_PY_VERSION=${versions[$PY_VERSION]}
	BUILD_ARGS="--build-arg FULL_PY_VERSION=$FULL_PY_VERSION --build-arg PY_VERSION=$PY_VERSION"

	# Base alpine
	tag="kikikanri/python$PY_VERSION:base-alpine"
	docker pull python:$FULL_PY_VERSION-alpine &&
		docker build -f ./base-alpine -t $tag $BUILD_ARGS . &&
		docker push $tag || exit 1

	# Base alpine gcc
	tag="kikikanri/python$PY_VERSION:base-alpine-gcc"
	docker pull kikikanri/python$PY_VERSION:base-alpine &&
		docker build -f ./base-alpine-gcc -t $tag $BUILD_ARGS . &&
		docker push $tag || exit 1

	# Base slim
	tag="kikikanri/python$PY_VERSION:base-slim"
	docker pull python:$FULL_PY_VERSION-slim &&
		docker build -f ./base-slim -t $tag $BUILD_ARGS . &&
		docker push $tag || exit 1
done
