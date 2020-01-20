FROM openjdk:8
RUN useradd --create-home -s /bin/bash java
USER java
COPY /usr/src/app/target/hello-world-1.0.0-SNAPSHOT.jar /usr/app/hello-world-1.0.0-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/app/hello-world-1.0.0-SNAPSHOT.jar"]
