# Giai đoan 1: Build ứng dụng
FROM maven:3.9.11-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .

RUN mvn package -DskipTests

# Giai đoạn 2: Chạy ứng dụng
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app

# Chỉ lấy file JAR đã được build từ giai đoạn trước
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

# Lên chạy ứng dụng
ENTRYPOINT ["java", "-jar", "app.jar"]