#
# Build stage
#
FROM ubuntu:latest AS build

RUN apt-get update
RUN apt-get install openjdk-11-jdk -y
COPY . .

RUN chmod +x ./gradlew
RUN ./gradlew bootJar --no-daemon

#
# Package stage
#
FROM openjdk:11
COPY --from=build /build/libs/GreenBean.jar GreenBean.jar
EXPOSE 8989
ENTRYPOINT ["java", "-jar", "GreenBean.jar","--spring.profiles.active=prod"]

