#!/bin/bash

tag="kikikanri/python3.11:base-alpine-gcc"

docker build --no-cache -t $tag . &&
	docker push $tag
