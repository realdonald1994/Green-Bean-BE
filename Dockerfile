#
# Build stage
#
FROM gradle:jdk11 as build

COPY . .

CMD ["./gradlew", "clean", "bootJar"]

#
# Package stage
#
FROM openjdk:11
VOLUME /tmp
COPY build/libs/GreenBean.jar GreenBean.jar
EXPOSE 8989
ENTRYPOINT ["java", "-jar", "GreenBean.jar","-Dspring.profiles.active=prod"]

