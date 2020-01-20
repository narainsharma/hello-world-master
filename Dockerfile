FROM maven:3.6-jdk-8-alpine
WORKDIR /usr/src/app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn package

FROM openjdk:8
ARG JAR_FILE=/usr/src/app/target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
