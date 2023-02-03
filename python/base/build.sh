#!/bin/bash

tag="kikikanri/python3.11:base"

docker build --no-cache -t $tag . &&
	docker push $tag
