#!/bin/bash

. ./setenv.sh

set -x

docker exec -t t9 sh -c "cat /opt/bitnami/tomcat/conf/server.xml | grep 'custom config'"
docker exec -t t9 sh -c "cat /opt/bitnami/tomcat/conf/server.xml | grep 'TLSv1.3,TLSv1.2'"
docker exec -t t9 sh -c "cat /opt/bitnami/tomcat/conf/tomcat-users.xml | grep 'admin-script'"
docker exec -t t9 sh -c "cat /opt/bitnami/tomcat/logs/catalina.*.log | grep 'APR'"
docker exec -t t9 sh -c "curl http://localhost:8080/index.html"
docker exec -t t9 sh -c "curl -k https://localhost:8443/index.html"

# docker exec -it t9 bash
