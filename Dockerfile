# Base image
FROM openjdk:11

# Set working directory
WORKDIR /app

# Make config folder
RUN mkdir config

# Copy the config.txt file into the container
COPY config.txt /config

# Copy the .jar file into the container
COPY JMusicBot-0.3.9.jar .

# Set the entrypoint to run the .jar file
ENTRYPOINT ["java", "-Dconfig=/config/config.txt", "-jar", "JMusicBot-0.3.9.jar"]
