FROM python:3.11-alpine3.20

# 1. Update OS to patch Busybox, libexpat, krb5, etc.
RUN apk update && apk upgrade --no-cache

# 2. Build dependencies
RUN apk add --no-cache uchardet gcc g++ musl-dev libffi-dev zlib-dev

# 3. Setup Legacy Build environment (vulnerable versions required for build)
RUN pip install --no-cache-dir --upgrade "pip<23.1" && \
    pip install --no-cache-dir --upgrade --force-reinstall \
    "setuptools<58.0.0" \
    "wheel==0.37.1" \
    "Cython"