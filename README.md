[![Build Status](https://travis-ci.org/AndriyKalashnykov/bitnami-tomcat9-jdk18-root-war.svg?branch=master)](https://travis-ci.org/AndriyKalashnykov/bitnami-tomcat9-jdk18-root-war)
[![Docker Pulls](https://img.shields.io/docker/pulls/andriykalashnykov/bitnami-tomcat9-jdk18-root-war.svg)](https://hub.docker.com/r/andriykalashnykov/bitnami-tomcat9-jdk18-root-war/)
[![License](https://img.shields.io/hexpm/l/plug.svg?maxAge=2592000)]()

# Java Web Application (WAR) deployed as root "/" context onto Customized Bitnami Tomcat 9

### Features

* Tomcat 9.0.34
* JDK 1.8
* WAR deployed as root context "/"

### Run image locally

```bash
docker login
docker run --name t9 -d andriykalashnykov/bitnami-tomcat9-jdk18-root-war:latest
docker exec -it t9 bash

$ cat /opt/bitnami/tomcat/logs/catalina.*.log | grep APR
$ curl -s http://localhost:8080/ | grep 'Example Web Application'
$ exit

docker stop t9
```

## Links

[Customized Bitnami Tomcat 9.0.34 + JDK 1.8]:
https://hub.docker.com/r/andriykalashnykov/bitnami-tomcat9-jdk18
[Java Web Application example]: https://github.com/AndriyKalashnykov/tomcat-root-war

[Customized Bitnami Tomcat 9.0.34 + JDK 1.8]

[Java Web Application example]

[How to change Tomcat ROOT application?](https://stackoverflow.com/questions/715506/how-to-change-the-root-application)