#!/bin/bash

VERSION=$(git rev-parse --short HEAD)
ARM_VERSIONED_TAG=$(git rev-parse --short v0.1.0^{commit})-arm64
REPO="phoenixvlabs/nexus-webtop-workbench:"
ARM_TAG="$REPO$ARM_VERSIONED_TAG"
ARM_LATEST="${REPO}arm64-latest"
BUILD_TIMESTAMP=$( date '+%F_%H:%M:%S' )

docker buildx build --platform linux/arm64 \
    -t "$ARM_TAG" \
    -t "$ARM_LATEST" \
    --build-arg VERSION="$VERSION" \
    --build-arg BUILD_TIMESTAMP="$BUILD_TIMESTAMP" \
    --no-cache --pull --push -f Dockerfile.mate.arm64 .