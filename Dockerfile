#
# Build stage
#
FROM ubuntu:latest as build

COPY . .

RUN ./gradlew bootJar --no-daemon

#
# Package stage
#
FROM openjdk:11
COPY --from=build /build/libs/GreenBean.jar GreenBean.jar
EXPOSE 8989
ENTRYPOINT ["java", "-jar", "GreenBean.jar","-Dspring.profiles.active=prod"]

