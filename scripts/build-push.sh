#!/bin/bash

. ./setenv.sh

set -x

docker rmi -f $(docker images | grep '<none>' | awk '{print $3}')  2>/dev/null
docker rmi -f ${DOCKER_LOGIN}/$IMAGE_NAME:$IMAGE_VERSION

cd ..

docker rmi -f ${DOCKER_LOGIN}/$IMAGE_NAME:$IMAGE_VERSION
docker build -f Dockerfile -t ${DOCKER_LOGIN}/$IMAGE_NAME:$IMAGE_VERSION .
docker login --username=${DOCKER_LOGIN} --password ${DOCKER_PWD} ${DOCKER_REGISTRY}
docker push ${DOCKER_LOGIN}/$IMAGE_NAME:$IMAGE_VERSION

cd ./scripts