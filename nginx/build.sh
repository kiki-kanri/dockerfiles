#!/bin/bash

tag="kikikanri/nginx:1.22.1"

docker build --no-cache -t $tag . &&
	docker push $tag
