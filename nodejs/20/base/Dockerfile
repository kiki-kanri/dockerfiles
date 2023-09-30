FROM node:current-alpine
LABEL org.opencontainers.image.authors="kiki-kanri"
LABEL version="1.0"

# Install and upgrade packages
RUN apk update && apk upgrade

# Setup package managers
RUN npm i npm@latest --global
RUN corepack enable
RUN corepack prepare pnpm@latest --activate
RUN yarn set version stable

CMD ["node"]
