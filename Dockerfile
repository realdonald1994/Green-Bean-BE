#
# Build stage
#
FROM gradle:jdk11 as build

COPY . .

WORKDIR /home/gradle/src

CMD ["./gradlew", "clean", "bootJar"]

#
# Package stage
#
FROM openjdk:11
COPY --from=build /home/gradle/src/build/libs/GreenBean.jar GreenBean.jar
EXPOSE 8989
ENTRYPOINT ["java", "-jar", "GreenBean.jar","-Dspring.profiles.active=prod"]

