#!/bin/bash

DOCKER_USERNAME="egracia"
DOCKER_REPO="ml"

SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"

for DIR in $SCRIPT_DIR/*/; do
    IMAGE_NAME=$(basename "$DIR")
    IMAGE_TAG="$DOCKER_USERNAME/$DOCKER_REPO:$IMAGE_NAME"
    docker build -t "$IMAGE_TAG" "$DIR"
    docker push "$IMAGE_TAG"
done
