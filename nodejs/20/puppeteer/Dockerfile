FROM kikikanri/node20:base
LABEL org.opencontainers.image.authors="kiki-kanri"
LABEL version="1.0"

# Install and upgrade packages
RUN echo @edge http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
RUN apk add --no-cache chromium icu-data-full wqy-zenhei@edge

# Set puppeteer env
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

CMD ["node"]
