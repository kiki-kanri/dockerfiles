#!/bin/bash

tag="kikikanri/python3.11:base"

docker pull python:3.11.5-slim &&
	docker build --no-cache -t $tag . &&
	docker push $tag
