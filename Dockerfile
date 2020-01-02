FROM node:latest
COPY ./src
RUN make /src

