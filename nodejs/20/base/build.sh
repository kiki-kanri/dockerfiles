#!/bin/bash

tag="kikikanri/node20:base"

docker pull node:current-alpine &&
	docker build -t $tag . &&
	docker push $tag
