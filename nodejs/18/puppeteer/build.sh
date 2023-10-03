#!/bin/bash

tag="kikikanri/node18:puppeteer"

docker build -t $tag . &&
	docker push $tag
