#!/bin/bash

tag="kikikanri/python3.11:base"

docker build -t $tag . &&
	docker push $tag
