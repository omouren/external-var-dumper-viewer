FROM node:8

MAINTAINER Olivier Mouren <mouren.olivier@gmail.com>

RUN mkdir /app

COPY . /app

WORKDIR /app

CMD npm run dev
