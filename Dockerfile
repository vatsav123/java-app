# Use official Maven base image to build the app
FROM maven:3.8.6-openjdk-11-slim AS build

# Set working directory
WORKDIR /app

# Copy the pom.xml and src folder to the container
COPY pom.xml .
COPY src/ ./src

# Build the application using Maven
RUN mvn clean install

# Check the contents of the target directory (for debugging)
RUN ls -l /app/target

# Create the runtime image
FROM openjdk:11-jre-slim

WORKDIR /app

# Copy the built JAR file from the previous stage
COPY --from=build /app/target/java-app.jar .

# Run the app
CMD ["java", "-jar", "java-app.jar"]

