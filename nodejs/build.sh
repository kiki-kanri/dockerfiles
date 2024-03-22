#!/bin/bash

declare -A versions=(
	["20"]="20"
	["21"]="21"
)

platforms="linux/amd64,linux/arm64"

for NODE_VERSION in "${!versions[@]}"; do
	# Base alpine
	node_image=node:${versions[$NODE_VERSION]}-alpine
	tag="kikikanri/node$NODE_VERSION:base-alpine"
	docker pull $node_image &&
		docker buildx build \
			-f ./base-alpine \
			-t $tag \
			--build-arg NODE_IMAGE=$node_image \
			--platform $platforms \
			--push . || exit 1

	# Base alpine puppeteer
	base_image="kikikanri/node$NODE_VERSION:base-alpine"
	tag="kikikanri/node$NODE_VERSION:puppeteer"
	docker pull $base_image &&
		docker buildx build \
			-f ./puppeteer \
			-t $tag \
			--build-arg BASE_IMAGE=$base_image \
			--platform $platforms \
			--push . || exit 1
done
