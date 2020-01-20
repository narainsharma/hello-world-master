FROM openjdk:8
RUN useradd --create-home -s /bin/bash java
USER java
COPY /usr/src/app/target/*.jar /usr/app/*.jar
ENTRYPOINT ["java","-jar","/usr/app/*.jar"]
