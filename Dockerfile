FROM node:latest
COPY ./src
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y ./src

