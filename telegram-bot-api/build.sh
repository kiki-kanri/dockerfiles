#!/bin/bash

name="telegram-bot-api"
platforms="linux/amd64,linux/arm64"
user="kikikanri"
version="7.11"
docker buildx build \
	-t $user/$name:$version \
	-t $user/$name:latest \
	--build-arg VERSION=$version \
	--builder multi-platform \
	--platform $platforms \
	--push .
