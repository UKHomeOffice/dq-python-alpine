FROM python:3.10.7-alpine3.16


RUN apk update --quiet \
    && apk upgrade --quiet
