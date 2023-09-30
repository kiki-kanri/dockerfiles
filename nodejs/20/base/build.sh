#!/bin/bash

tag="kikikanri/node20:base"

docker pull node:current-alpine &&
	docker build --no-cache -t $tag . &&
	docker push $tag
