#
# Build stage
#
FROM gradle:jdk11 as build

COPY . .

WROKDIR /home/gradle/src/

RUN gradle clean build --parallel

#
# Package stage
#
FROM openjdk:11
COPY --from=build /home/gradle/src/build/libs/GreenBean.jar GreenBean.jar
EXPOSE 8083
ENTRYPOINT ["java", "-jar", "GreenBean.jar","-Dspring.profiles.active=prod"]

