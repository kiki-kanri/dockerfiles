#!/bin/bash

tag="kikikanri/python3.11:base-alpine"

docker pull python:3.11.6-alpine &&
	docker build --no-cache -t $tag . &&
	docker push $tag
