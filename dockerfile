FROM maven:3.8.7-openjdk-18-slim as build
MAINTAINER rajugopu123@gmail.com

 

 

WORKDIR /app
COPY . .
RUN mvn clean install -Dmaven.test.skip=true

 

 

 

FROM tomcat:9.0-alpine
MAINTAINER "admin"
USER root
COPY --from=build /app/target/LESM-Status-Monitor-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]
