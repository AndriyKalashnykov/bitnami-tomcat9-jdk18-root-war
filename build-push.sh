#!/bin/bash

set -x

DOCKER_LOGIN=
DOCKER_PWD=
DOCKER_REGISTRY=registry-1.docker.io

IMAGE_NAME=bitnami-tomcat9-jdk18-root-war
IMAGE_VERSION=1.0

# If ERRORR: No space left on device
# docker rmi -f $(docker images | grep '<none>' | awk '{print $3}')  2>/dev/null

docker build -f Dockerfile -t ${DOCKER_LOGIN}/$IMAGE_NAME:$IMAGE_VERSION .
docker login --username=${DOCKER_LOGIN} --password ${DOCKER_PWD} ${DOCKER_REGISTRY}
docker push ${DOCKER_LOGIN}/$IMAGE_NAME:$IMAGE_VERSION
