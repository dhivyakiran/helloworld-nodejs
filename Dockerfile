FROM node:10
COPY . /src
RUN make /src

