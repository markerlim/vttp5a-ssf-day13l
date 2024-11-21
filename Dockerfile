# Use the Maven image as the base
FROM maven:3.9.9-eclipse-temurin-23

# Set up labels for metadata
LABEL MAINTAINER="marcus"
LABEL DESCRIPTION="vttp ssf day 03 lecture walkthrough"
LABEL version="1.0"
LABEL name="vttp5-ssf-day03l"

# Define application directory
ARG APP_DIR=/app
WORKDIR ${APP_DIR}

# Copy project files into the image
COPY pom.xml .
COPY mvnw .
COPY mvnw.cmd .
COPY .mvn .mvn
COPY src src

# Ensure the `mvnw` script has execution permissions
RUN chmod +x mvnw

# Build the application
RUN ./mvnw package -Dmaven.test.skip=true

# Set the server port
ENV SERVER_PORT=3000

# Expose the port
EXPOSE ${SERVER_PORT}

# Run the application
ENTRYPOINT ["java", "-jar", "target/vttp5-ssf-day03l-0.0.1-SNAPSHOT.jar"]
