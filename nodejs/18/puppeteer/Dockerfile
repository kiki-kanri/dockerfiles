FROM node:18-alpine
LABEL org.opencontainers.image.authors="kiki-kanri"
LABEL version="1.0"

# Install and upgrade packages
RUN apk update && apk upgrade
RUN echo @edge http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
RUN apk add chromium icu-data-full wqy-zenhei@edge
RUN rm -rf /var/cache/apk/*
RUN npm i npm@latest --global

# Setup pnpm
RUN corepack enable
RUN corepack prepare pnpm@latest --activate

# Set puppeteer env
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

CMD ["node"]
