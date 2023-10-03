#!/bin/bash

tag="kikikanri/python3.12:base"

docker pull python:3.12.0-slim &&
	docker build -t $tag . &&
	docker push $tag
