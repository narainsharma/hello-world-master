FROM openjdk:8
RUN useradd --create-home -s /bin/bash java
USER java
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
