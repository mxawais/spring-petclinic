# Step 1: Use base image
FROM openjdk:21-jdk-slim

# Step 2: Copy JAR to container
COPY target/spring-petclinic-*.jar app.jar

# Step 3: Expose the port
EXPOSE 8081

# Step 4: Run the JAR
ENTRYPOINT ["java", "-jar", "/app.jar", "--server.port=8081"]
