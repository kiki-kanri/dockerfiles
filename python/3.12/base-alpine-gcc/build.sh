#!/bin/bash

tag="kikikanri/python3.12:base-alpine-gcc"

docker pull kikikanri/python3.12:base-alpine &&
	docker build -t $tag . &&
	docker push $tag
