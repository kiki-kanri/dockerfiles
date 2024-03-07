#!/bin/sh

args=""
[ -n "$LOCAL" ] && args="$args --local"
[ -n "$PORT" ] && args="$args -p $PORT"
telegram-bot-api --api-id $API_ID --api-hash $API_HASH $args
