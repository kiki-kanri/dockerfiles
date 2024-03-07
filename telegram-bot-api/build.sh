#!/bin/bash

name="telegram-bot-api"
user="kikikanri"
version="7.1"
docker build $@ -t $user/$name:$version -t $user/$name:latest --build-arg VERSION=$version . || exit
docker push $user/$name:$version
docker push $user/$name:latest
