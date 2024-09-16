FROM python:3.11-alpine3.17

RUN apk update --quiet \
  && apk upgrade libcrypto3 libssl3 libexpat sqlite-libs --quiet \
    && apk upgrade --quiet
RUN pip install --no-cache-dir --upgrade pip==24.1
RUN pip install -U setuptools==70.0.0