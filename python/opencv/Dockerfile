FROM kikikanri/python3.11:base
LABEL org.opencontainers.image.authors="kiki-kanri"
LABEL version="1.0"

RUN apt-get update
RUN apt-get install libsm6 libxext6 libxrender-dev -y

CMD ["python3.11"]
