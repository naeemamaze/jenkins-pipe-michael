FROM maven:3.6.3-jdk-8 AS build-env
WORKDIR /app

COPY pom.xml ./
RUN mvn dependency:go-offline

COPY . ./
RUN echo "START: Running Tests"
RUN ./mvnw compile
RUN ./mvnw test
RUN echo "END: Tests completed "
RUN ./mvnw generate-resources
RUN ./mvnw package

FROM openjdk:8-jre-alpine
EXPOSE 9449

WORKDIR /app
COPY --from=build-env /app/target/spring-petclinic-2.4.0.BUILD-SNAPSHOT.jar ./spring-petclinic.jar
CMD ["java", "-jar", "/spring-petclinic.jar"]
