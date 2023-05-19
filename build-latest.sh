#!/bin/bash
set -e

# docker buildx create --name ki_builder
# docker buildx create --name ki_builder --driver-opt env.BUILDKIT_STEP_LOG_MAX_SIZE=50000000,env.BUILDKIT_STEP_LOG_MAX_SPEED=100000000 --use
docker buildx use ki_builder

# load cross-platform emulator
docker run --privileged --rm tonistiigi/binfmt --install all

# Make sure to always have fresh base image
docker pull debian:11

# Build dev image with just binaries
docker buildx build --pull --rm --platform linux/arm64,linux/amd64 -t kitobor/ki-gpt:latest -f Dockerfile "." --push

# docker buildx build --pull --rm -f Dockerfile.export --platform linux/arm64,linux/amd64 -t kitobor/ki-gpt:latest --output out .
