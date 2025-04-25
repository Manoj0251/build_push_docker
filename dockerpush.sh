#!/bin/bash
# To build, tag and push image below is the command
#  bash dockerpush.sh REPO_lINK VERSION
# example : bash dockerpush.sh manoj0251/build_push_docker 2.3.1
# You can manually update the REPO if need

VERSION=$2
REPO=$1
echo "Building the docker Image for version:"$VERSION
docker build -t $REPO:$VERSION .
# If you have a docker file with a different name , comment the above command and enable below command
# docker build -t $REPO:$VERSION -f /path/to/Dockerfile .
docker images
IMAGE_ID=$(docker images --format "{{.ID}}" --no-trunc $REPO:$VERSION | cut -c8-19)
echo $IMAGE_ID
docker tag $IMAGE_ID $REPO:$VERSION
docker push $REPO:$VERSION
echo "Docker images $VERSION with Image ID: $IMAGE_ID is pushed to $REPO"
