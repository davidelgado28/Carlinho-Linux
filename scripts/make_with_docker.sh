#!/bin/sh
set -e

IMAGE_NAME="carlinho-builder"

docker build -t $IMAGE_NAME .
docker run --rm -v "$(pwd):/build" $IMAGE_NAME make all
