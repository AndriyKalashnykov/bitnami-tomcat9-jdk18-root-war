#!/bin/bash

set -x

# DOCKER_LOGIN=
# DOCKER_PWD=
DOCKER_REGISTRY=registry-1.docker.io

IMAGE_NAME=bitnami-tomcat9-jdk18-root-war
IMAGE_VERSION=1.0

docker rmi -f $(docker images | grep '<none>' | awk '{print $3}')  2>/dev/null
docker rmi -f ${DOCKER_LOGIN}/$IMAGE_NAME:$IMAGE_VERSION

docker build -f Dockerfile -t ${DOCKER_LOGIN}/$IMAGE_NAME:$IMAGE_VERSION .
docker login --username=${DOCKER_LOGIN} --password ${DOCKER_PWD} ${DOCKER_REGISTRY}
docker push ${DOCKER_LOGIN}/$IMAGE_NAME:$IMAGE_VERSION
