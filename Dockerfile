FROM openjdk:8
ARG JAR_FILE=/usr/src/app/target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
