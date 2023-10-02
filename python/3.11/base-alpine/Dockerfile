FROM python:3.11.5-alpine
LABEL org.opencontainers.image.authors="kiki-kanri"
LABEL version="1.0"

RUN apk update && apk upgrade --no-cache
RUN apk add --no-cache libmagic
RUN python3.11 -m pip install -U --no-cache-dir pip python-dateutil

CMD ["python3.11"]
