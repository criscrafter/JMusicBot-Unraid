# Base image
FROM openjdk:11

# Set working directory
WORKDIR /app

# Create the archiv directory
RUN mkdir config

# Copy the .jar file into the container
COPY JMusicBot-0.3.9.jar .

# Set the entrypoint to run the .jar file
ENTRYPOINT ["java", "-jar", "JMusicBot-0.3.9.jar"]
