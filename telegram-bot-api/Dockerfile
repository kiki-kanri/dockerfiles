# Build stage
FROM alpine:latest as build-stage

## Set workdir
WORKDIR /app

## Install packages
RUN apk update && apk upgrade --no-cache
RUN apk add -lu --no-cache alpine-sdk cmake git gperf linux-headers openssl-dev zlib-dev

## Clone repository
RUN git clone --recursive https://github.com/tdlib/telegram-bot-api.git

## Build
RUN cd telegram-bot-api &&\
	rm -rf build && \
	mkdir build && \
	cd build && \
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=.. .. && \
	cmake --build . --parallel 16 --target install

# Runtime stage
FROM alpine:latest

## Set args
ARG VERSION

## Set labels
LABEL description="Docker image for Telegram Bot API, not officially affiliated with Telegram. For details on the Telegram Bot API, visit the project's GitHub repository."
LABEL dockerfile_repository="https://github.com/kiki-kanri/dockerfiles/tree/main/telegram-bot-api"
LABEL org.opencontainers.image.authors="kiki-kanri"
LABEL source_repository="https://github.com/tdlib/telegram-bot-api"
LABEL version="$VERSION"

## Set workdir
WORKDIR /app

## Install packages
RUN apk update && apk upgrade --no-cache
RUN apk add --no-cache --update gcc

## Copy files
COPY --from=build-stage ["/app/telegram-bot-api/bin/telegram-bot-api", "/usr/local/bin"]

## Copy entrypoint and set cmd
COPY ["entrypoint.sh", "./"]
CMD ["sh", "./entrypoint.sh"]
