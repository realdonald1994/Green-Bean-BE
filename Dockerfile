#
# Build stage
#
FROM openjdk:11 AS build
COPY . .
RUN ./gradlew clean bootJar

#
# Package stage
#
FROM openjdk:11
ADD build/libs/GreenBean*.jar GreenBean.jar
EXPOSE 8083
ENTRYPOINT ["java", "-jar", "GreenBean.jar","-Dspring.profiles.active=prod"]

