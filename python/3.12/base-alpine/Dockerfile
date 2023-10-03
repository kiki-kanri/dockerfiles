FROM python:3.12.0-alpine
LABEL org.opencontainers.image.authors="kiki-kanri"
LABEL version="1.0"

RUN apk update && apk upgrade --no-cache
RUN apk add --no-cache libmagic
RUN python3.12 -m pip install -U --no-cache-dir pip python-dateutil setuptools wheel

CMD ["python3.12"]
