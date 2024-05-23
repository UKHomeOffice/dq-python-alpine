FROM python:3.11-alpine


RUN apk update --quiet \
  && apk upgrade libcrypto3 libssl3 --quiet \
    && apk upgrade --quiet

