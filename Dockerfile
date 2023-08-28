FROM maven:latest AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

FROM openjdk:latest
COPY --from=build /home/app/target/spring-petclinic-3.1.0-SNAPSHOT.jar /usr/local/lib/demo.jar
EXPOSE 80
ENTRYPOINT ["java","-jar","/usr/local/lib/demo.jar"]

