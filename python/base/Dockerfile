FROM python:3.11.3-slim
LABEL org.opencontainers.image.authors="kiki-kanri"
LABEL version="1.0"

RUN apt-get update && apt-get upgrade -y
RUN apt-get install libmagic1 -y
RUN apt-get autoremove --purge -y && apt-get autoclean -y
RUN python3.11 -m pip install -U --no-cache-dir pip python-dateutil

CMD ["python3.11"]
