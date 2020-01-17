FROM maven:3.6-jdk-8-alpine
WORKDIR /usr/src/app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn package

FROM openjdk:8
RUN useradd --create-home -s /bin/bash java
USER java
COPY --from=build /usr/src/app/target/hello-world-1.0.0-SNAPSHOT.jar /usr/app/hello-world-1.0.0-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/app/hello-world-1.0.0-SNAPSHOT.jar"]
