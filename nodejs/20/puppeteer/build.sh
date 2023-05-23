#!/bin/bash

tag="kikikanri/node20:puppeteer"

docker build --no-cache -t $tag . &&
	docker push $tag
