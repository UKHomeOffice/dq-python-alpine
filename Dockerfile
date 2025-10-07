FROM python:3.11-alpine3.17

RUN apk update --quiet \
  && apk upgrade libcrypto3 libssl3 --quiet \
    && apk upgrade --quiet


RUN pip install -U setuptools==78.1.1 \
    && pip install --upgrade pip \
