FROM docker.io/library/python:3.9.1-slim-buster

RUN mkdir /openslides && apt update && apt upgrade && apt install gcc -y
WORKDIR /openslides
RUN pip3 install openslides

EXPOSE 8000
CMD openslides
