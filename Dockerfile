# Base image
FROM openjdk:11

# Set working directory
WORKDIR /app

# Make config folder
RUN mkdir config

# Copy the .jar file into the container
COPY JMusicBot-0.3.9.jar .

# Copy the config.txt file into the container
COPY config.txt /app/config.txt

# Copy the entrypoint script to the container
COPY entrypoint.sh /app/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /app/entrypoint.sh

# Set the entrypoint to run the entrypoint script
ENTRYPOINT ["/app/entrypoint.sh"]