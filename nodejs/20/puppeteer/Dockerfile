FROM node:20-alpine3.17
LABEL org.opencontainers.image.authors="kiki-kanri"
LABEL version="1.0"

RUN apk update && apk upgrade
RUN echo @edge http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
RUN apk add chromium icu-data-full wqy-zenhei@edge
RUN rm -rf /var/cache/apk/*
RUN npm i npm@latest --global
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

CMD ["node"]
