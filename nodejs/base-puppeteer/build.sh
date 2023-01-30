#!/bin/bash

name="nodejs-base-puppeteer"

docker build -t kikikanri/$name:latest . &&
	docker push kikikanri/$name:latest
