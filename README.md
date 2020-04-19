[![Build Status](https://travis-ci.org/AndriyKalashnykov/bitnami-tomcat9-jdk18-root-war.svg?branch=master)](https://travis-ci.org/AndriyKalashnykov/bitnami-tomcat9-jdk18-root-war)
[![Docker Pulls](https://img.shields.io/docker/pulls/andriykalashnykov/bitnami-tomcat9-jdk18-root-war.svg)](https://hub.docker.com/r/andriykalashnykov/bitnami-tomcat9-jdk18-root-war/)
[![License](https://img.shields.io/hexpm/l/plug.svg?maxAge=2592000)]()

# Java Web Application (WAR) deployed as root "/" context onto Customized Bitnami Tomcat 9

### Features

* Tomcat 9.0.34
* JDK 1.8.242-0
* WAR deployed as root context "/"
* Custom configuration files from /tomcat/conf override default configuration /opt/bitnami/tomcat/conf
  * server.xml
  * localhost.crt
  * localhost.key
* Port 8080 forwards to 8443
* Port 8443 configured with [HTTP/2] protocol over [TLS] 1.2/1.3 using [Apache APR] and [APR Tomcat Connector]

### Base Docker image

* [Customized Bitnami Tomcat 9.0.34 + JDK 1.8.242-0]

### Java Web Application

* [Example Java Web Application (WAR)]

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