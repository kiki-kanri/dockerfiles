FROM node:current-alpine
LABEL org.opencontainers.image.authors="kiki-kanri"
LABEL version="1.0"

# Install and upgrade packages
RUN apk update && apk upgrade --no-cache
RUN apk add --no-cache bash

# Setup package managers
RUN npm i npm@latest -g
RUN npm upgrade -g
RUN corepack enable
RUN corepack install --global pnpm@latest
RUN corepack install --global yarn@stable

CMD ["node"]
