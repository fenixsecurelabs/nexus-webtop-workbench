#!/bin/bash

VERSION=$(git rev-parse --short HEAD)
AMD_VERSIONED_TAG=$(git rev-parse --short v0.1.0^{commit})-amd64
REPO="phoenixvlabs/nexus-webtop-workbench:"
AMD_TAG="$REPO$AMD_VERSIONED_TAG"
AMD_LATEST="${REPO}amd64-latest"
BUILD_TIMESTAMP=$( date '+%F_%H:%M:%S' )

docker buildx build --platform linux/amd64 \
    -t "$AMD_TAG" \
    -t "$AMD_LATEST" \
    --build-arg VERSION="$VERSION" \
    --build-arg BUILD_TIMESTAMP="$BUILD_TIMESTAMP" \
    --no-cache --pull --push -f Dockerfile.mate.amd64 .