#!/bin/bash

tag="kikikanri/python3.11:base-alpine-gcc"

docker pull kikikanri/python3.11:base-alpine &&
	docker build -t $tag . &&
	docker push $tag
