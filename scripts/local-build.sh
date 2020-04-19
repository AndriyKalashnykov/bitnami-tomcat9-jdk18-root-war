#!/bin/bash

. ./setenv.sh

set -x

docker stop t9

scripts_dir=$PWD

mkdir ~/projects
cd ~/projects
git clone https://github.com/AndriyKalashnykov/tomcat-root-war

cd ~/projects/tomcat-root-war/
mvn clean package
cd $scripts_dir
cp ~/projects/tomcat-root-war/target/ROOT.war ../

docker rmi -f $(docker images | grep '<none>' | awk '{print $3}')  2>/dev/null
docker rmi -f $IMAGE_NAME:$IMAGE_VERSION

cd ..
docker logout
docker build -f Dockerfile -t $IMAGE_NAME:$IMAGE_VERSION .
rm ROOT.war
cd ./scripts

docker run --name t9 -d --rm -p 8080:8080 -p 8443:8443 $IMAGE_NAME:$IMAGE_VERSION 
