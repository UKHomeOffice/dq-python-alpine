FROM python:3.10-alpine3.16

RUN apk update --quiet \
    && apk upgrade --quiet
