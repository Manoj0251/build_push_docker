#!/bin/bash

REPO="manoj0251/build_push_docker"
VERSION=$1
echo "Building the docker Image for version:"$VERSION
docker build -t $REPO:$VERSION .
docker images
IMAGE_ID=$(docker images --format "{{.ID}}" --no-trunc $REPO:$VERSION | cut -c8-19)
echo $IMAGE_ID
docker tag $IMAGE_ID $REPO:$VERSION
docker push $REPO:$VERSION
echo "Docker images $VERSION with Image ID: $IMAGE_ID is pushed to $REPO"