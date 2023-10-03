#!/bin/bash

tag="kikikanri/python3.11:base"

docker pull python:3.11.6-slim &&
	docker build -t $tag . &&
	docker push $tag
