FROM python:3.11-alpine3.18

RUN apk update --quiet \
  && apk upgrade libcrypto3 libssl3 --quiet \
    && apk upgrade --quiet


RUN pip install -U setuptools==70.0.0 \
    && pip install --upgrade pip \
