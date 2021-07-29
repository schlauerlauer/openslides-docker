FROM docker.io/library/python:3.9.1-slim-buster

RUN apt update && apt install -y gcc
WORKDIR /openslides
RUN pip3 install openslides

EXPOSE 8000
CMD openslides
