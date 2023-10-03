#!/bin/bash

tag="kikikanri/python3.12:base-alpine"

docker pull python:3.12.0-alpine &&
	docker build -t $tag . &&
	docker push $tag
