#!/bin/sh

args=""
[ -n "$API_HASH" ] && args="$args --api-hash $API_HASH"
[ -n "$API_ID" ] && args="$args --api-id $API_ID"
[ -n "$LOCAL" ] && args="$args --local"
[ -n "$HTTP_PORT" ] && args="$args -p $HTTP_PORT"
telegram-bot-api $args
