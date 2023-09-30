#!/bin/bash

tag="kikikanri/node20:puppeteer"

docker kikikanri/node20:base &&
	docker build --no-cache -t $tag . &&
	docker push $tag
