# Use official Maven base image to build the app
FROM maven:3.8.6-openjdk-11-slim AS build

# Set working directory
WORKDIR /app

# Copy the pom.xml and src folder to the container
COPY pom.xml .

# Build the application using Maven
RUN mvn clean install

# Create the runtime image
FROM openjdk:11-jre-slim

WORKDIR /app

# Copy the built JAR file from the previous stage
COPY --from=build /app/target/java-app.jar .

# Run the app
CMD ["java", "-jar", "java-app.jar"]
