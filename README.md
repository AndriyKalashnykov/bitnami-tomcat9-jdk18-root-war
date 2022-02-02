[![Docker Image CI](https://github.com/AndriyKalashnykov/bitnami-tomcat9-jdk18-root-war/actions/workflows/docker-image.yml/badge.svg)](https://github.com/AndriyKalashnykov/bitnami-tomcat9-jdk18-root-war/actions/workflows/docker-image.yml)
[![Build Status](https://travis-ci.org/AndriyKalashnykov/bitnami-tomcat9-jdk18-root-war.svg?branch=master)](https://travis-ci.org/AndriyKalashnykov/bitnami-tomcat9-jdk18-root-war)
[![Docker Pulls](https://img.shields.io/docker/pulls/andriykalashnykov/bitnami-tomcat9-jdk18-root-war.svg)](https://hub.docker.com/r/andriykalashnykov/bitnami-tomcat9-jdk18-root-war/)
[![License](https://img.shields.io/hexpm/l/plug.svg?maxAge=2592000)]()
[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FAndriyKalashnykov%2Fbitnami-tomcat9-jdk18-root-war&count_bg=%2333CD56&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://hits.seeyoufarm.com)

# Java Web Application (WAR) deployed as root "/" context onto Customized Bitnami Tomcat 9

### Features

* Tomcat 9.0.34
* JDK 1.8.242-0
* WAR deployed as root context "/"
* Tomcat configuration files from /tomcat/conf override default configuration /opt/bitnami/tomcat/conf
  * [server.xml]
  * [localhost.crt]
  * [localhost.key]
* Port [8080] forwards to [8443]
* Port [8443] configured with [HTTP/2] protocol over [TLS] 1.2/1.3 using [Apache APR] and [APR Tomcat Connector]

### How it's done

####  Java Web Application (WAR) deployed as Tomcat's root "/" context

* [ROOT.war](https://github.com/AndriyKalashnykov/tomcat-root-war) gets [built]
* [autoDeploy and deployOnStartUp] attributes of the tag `<Host name="localhost"  appBase="webapps".../>` are set to "false"
* [/tomcat/conf/server.xml] overrides default server.xml
* defalut ROOT folder gets [deleted]
* ROOT.war gets [copied] to /opt/bitnami/tomcat/webapps


### Base Docker image

* [Customized Bitnami Tomcat 9.0.34 + JDK 1.8.242-0]

### Java Web Application

* [Example Java Web Application (WAR)]


### bitnami-tomcat9-jdk18-root-war on DockerHub

* [bitnami-tomcat9-jdk18-root-war on DockerHub]

### Run image

```bash
docker login
docker run --name t9 -d --rm -p 8080:8080 -p 8443:8443 andriykalashnykov/bitnami-tomcat9-jdk18-root-war:latest
```

### Test image

```bash
docker exec -t t9 sh -c "cat /opt/bitnami/tomcat/conf/server.xml | grep 'custom config'"
docker exec -t t9 sh -c "cat /opt/bitnami/tomcat/conf/server.xml | grep 'TLSv1.3,TLSv1.2'"
docker exec -t t9 sh -c "cat /opt/bitnami/tomcat/logs/catalina.*.log | grep 'APR'"
docker exec -t t9 sh -c "cat /opt/bitnami/tomcat/conf/tomcat-users.xml | grep 'admin-script'"
docker exec -t t9 sh -c "curl http://localhost:8080/index.html"
docker exec -t t9 sh -c "curl -k https://localhost:8443/index.html"
```

### Stop image

```bash
docker stop t9
```

[Customized Bitnami Tomcat 9.0.34 + JDK 1.8.242-0]:
https://hub.docker.com/r/andriykalashnykov/bitnami-tomcat9-jdk18

[Example Java Web Application (WAR)]: https://github.com/AndriyKalashnykov/tomcat-root-war

[Apache APR]: https://apr.apache.org/

[APR Tomcat Connector]: http://tomcat.apache.org/tomcat-9.0-doc/apr.html

[HTTP/2]: https://en.wikipedia.org/wiki/HTTP/2

[TLS]: https://en.wikipedia.org/wiki/Transport_Layer_Security

[8080]: https://github.com/AndriyKalashnykov/bitnami-tomcat9-jdk18-root-war/blob/3606f5c6486d06f3006fdb47c586171a026b2e70/tomcat/conf/server.xml#L69

[8443]: https://github.com/AndriyKalashnykov/bitnami-tomcat9-jdk18-root-war/blob/3606f5c6486d06f3006fdb47c586171a026b2e70/tomcat/conf/server.xml#L71

[server.xml]: https://github.com/AndriyKalashnykov/bitnami-tomcat9-jdk18-root-war/blob/master/tomcat/conf/server.xml

[localhost.crt]: https://github.com/AndriyKalashnykov/bitnami-tomcat9-jdk18-root-war/blob/master/tomcat/conf/localhost.crt

[localhost.key]: https://github.com/AndriyKalashnykov/bitnami-tomcat9-jdk18-root-war/blob/master/tomcat/conf/localhost.key

[autoDeploy and deployOnStartUp]: https://github.com/AndriyKalashnykov/bitnami-tomcat9-jdk18-root-war/blob/165246dba8f0e51ece6d3557368b168339312817/tomcat/conf/server.xml#L158

[/tomcat/conf/server.xml]: https://github.com/AndriyKalashnykov/bitnami-tomcat9-jdk18-root-war/blob/165246dba8f0e51ece6d3557368b168339312817/Dockerfile#L24

[built]: https://github.com/AndriyKalashnykov/bitnami-tomcat9-jdk18-root-war/blob/165246dba8f0e51ece6d3557368b168339312817/Dockerfile#L5

[deleted]: https://github.com/AndriyKalashnykov/bitnami-tomcat9-jdk18-root-war/blob/165246dba8f0e51ece6d3557368b168339312817/Dockerfile#L26

[copied]: https://github.com/AndriyKalashnykov/bitnami-tomcat9-jdk18-root-war/blob/165246dba8f0e51ece6d3557368b168339312817/Dockerfile#L29

[bitnami-tomcat9-jdk18-root-war on DockerHub]: https://hub.docker.com/r/andriykalashnykov/bitnami-tomcat9-jdk18-root-war
