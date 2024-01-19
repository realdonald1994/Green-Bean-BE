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
COPY --from=build /build/libs/GreenBean.jar GreenBean.jar
EXPOSE 8989
ENTRYPOINT ["java", "-jar", "GreenBean.jar","-Dspring.profiles.active=prod"]

