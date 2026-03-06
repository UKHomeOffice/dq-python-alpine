FROM python:3.11-alpine3.17

RUN apk update --quiet \
  && apk upgrade libcrypto3 libssl3 --quiet \
    && apk upgrade --quiet


RUN pip install --no-cache-dir -U pip \
    && pip install --no-cache-dir --upgrade --force-reinstall "wheel==0.46.2" setuptools \
    && pip show wheel
