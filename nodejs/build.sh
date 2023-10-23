#!/bin/bash

declare -A versions=(
	["20"]="20"
	["21"]="21"
)

for NODE_VERSION in "${!versions[@]}"; do
	# Base alpine
	node_image=node:${versions[$NODE_VERSION]}-alpine
	tag="kikikanri/node$NODE_VERSION:base-alpine"
	docker pull $node_image &&
		docker build -f ./base-alpine -t $tag --build-arg NODE_IMAGE=$node_image . &&
		docker push $tag || exit 1

	# Puppeteer
	base_image=$tag
	tag="kikikanri/node$NODE_VERSION:puppeteer"
	docker pull $base_image &&
		docker build -f ./puppeteer -t $tag --build-arg BASE_IMAGE=$base_image . &&
		docker push $tag || exit 1
done
