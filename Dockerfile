FROM python:3.7.9-alpine3.11

RUN apk update --quiet \
    && apk upgrade --quiet
