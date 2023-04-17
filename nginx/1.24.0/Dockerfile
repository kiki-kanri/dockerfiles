FROM nginx:1.24.0-alpine
LABEL org.opencontainers.image.authors="kiki-kanri"
LABEL version="1.0"

RUN apk update && apk upgrade
COPY ["./nginx.conf", "/etc/nginx/nginx.conf"]
