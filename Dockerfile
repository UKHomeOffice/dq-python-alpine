FROM python:3.10-alpine3.15

RUN apk update --quiet \
    && apk upgrade --quiet
