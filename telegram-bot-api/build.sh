#!/bin/bash

name="telegram-bot-api"
platforms="linux/386,linux/amd64,linux/arm64,linux/arm/v7,linux/ppc64le"
user="kikikanri"
version="7.11"
docker buildx build \
	-t $user/$name:$version \
	-t $user/$name:latest \
	--build-arg VERSION=$version \
	--builder multi-platform \
	--platform $platforms \
	--push .
