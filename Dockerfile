# --- STAGE 1: Builder (Insecure tools allowed here) ---
FROM python:3.11-alpine3.20 AS builder

# Install the specific versions needed to compile Faust
RUN pip install --no-cache-dir "setuptools<58.0.0" "wheel==0.37.1" "Cython"

WORKDIR /build
# Build your wheels here (e.g., Faust, aiokafka, etc.)
RUN pip wheel --no-cache-dir --wheel-dir=/build/wheels faust-streaming==0.10.15

# --- STAGE 2: Final (The image that gets scanned by Trivy) ---
FROM python:3.11-alpine3.20

# 1. Patch OS
RUN apk update && apk upgrade --no-cache

# 2. UPGRADE PIP & SETUPTOOLS IMMEDIATELY
# This removes the vulnerable v23.0.1 and v57.5.0 from the image
RUN pip install --no-cache-dir --upgrade pip setuptools wheel

WORKDIR /app

# 3. Copy wheels from builder and install them
COPY --from=builder /build/wheels /app/wheels
RUN pip install --no-cache-dir /app/wheels/*.whl

# 4. NUCLEAR OPTION: Remove the tools entirely after installation
# This is the most secure way to pass Trivy
RUN pip uninstall -y pip setuptools wheel && \
    rm -rf /app/wheels /root/.cache

# Final setup
USER 1000
CMD ["python", "-m", "app.consumer"]