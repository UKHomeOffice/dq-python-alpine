FROM python:3.11-alpine3.17


RUN apk update --quiet \
    && apk upgrade --quiet
