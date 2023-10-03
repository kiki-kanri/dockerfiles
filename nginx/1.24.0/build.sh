#!/bin/bash

tag="kikikanri/nginx:1.24.0"

docker build -t $tag . &&
	docker push $tag
