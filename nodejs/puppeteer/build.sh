#!/bin/bash

tag="kikikanri/node18:puppeteer"

docker build --no-cache -t $tag . &&
	docker push $tag
