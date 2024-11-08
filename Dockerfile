# Use the OpenJDK 11 image
FROM openjdk:11

# Copy the application JAR file (make sure to replace 'yourapp.jar' with your real JAR filename)
COPY target/yourapp.jar /yourapp.jar

# Run the application
ENTRYPOINT ["java", "-jar", "/yourapp.jar"]
