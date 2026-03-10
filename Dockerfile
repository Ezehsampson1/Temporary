FROM maven:3.9-eclipse-temurin-21 AS builder

WORKDIR /app

COPY simple-java-app/pom.xml .

RUN mvn dependency:go-offline -B

COPY simple-java-app/src ./src

RUN mvn clean package -DskipTests

FROM gcr.io/distroless/java21-debian12

COPY --from=builder /app/target/*.jar /app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-XX:MaxRAMPercentage=75.0", "-jar", "/app.jar"]