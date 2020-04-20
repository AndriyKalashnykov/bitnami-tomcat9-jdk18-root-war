
# https://github.com/debuerreotype/docker-debian-artifacts/blob/dist-amd64/buster/slim/Dockerfile
# https://github.com/docker-library/openjdk/blob/master/8/jdk/slim/Dockerfile
# https://github.com/carlossg/docker-maven/blob/d3dd6bc261c6173c5e52e3a7a36b6a3d8d2800b4/jdk-8-slim/Dockerfile
FROM maven:3.6.3-jdk-8-slim as build
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/AndriyKalashnykov/tomcat-root-war.git
WORKDIR /tomcat-root-war
RUN mvn dependency:go-offline 
RUN mvn package

# Tomcat 9.0.34-0 and JDK 1.8.242-0
FROM docker.io/andriykalashnykov/bitnami-tomcat9-jdk18:1.0

# Tomcat 9.0.34-0 and JDK 11.0.6-0
# FROM docker.io/bitnami/tomcat:9.0-debian-10

LABEL Name="bitnami-tomcat9-jdk18-root-war" \
    Vendor="Andriy Kalashnykov" \
    Maintainer="Andriy Kalashnykov (https://github.com/AndriyKalashnykov/)" \
    Version="1.0" \
    License="Apache License, Version 2.0"

COPY --chown=1001:1001 ./tomcat/conf /opt/bitnami/tomcat/conf

RUN rm -rf /opt/bitnami/tomcat/webapps/ROOT
RUN rm -rf /opt/bitnami/tomcat/webapps_default/ROOT

COPY --from=build --chown=1001:1001 /tomcat-root-war/target/ROOT.war /opt/bitnami/tomcat/webapps

EXPOSE 8080
EXPOSE 8443

