#!/bin/bash

tag="kikikanri/python3.11:opencv"

docker build -t $tag . &&
	docker push $tag
