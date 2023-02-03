#!/bin/bash

tag="kikikanri/python3.11:opencv"

docker build --no-cache -t $tag . &&
	docker push $tag
