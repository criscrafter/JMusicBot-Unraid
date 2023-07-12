# Base image
FROM eclipse-temurin:11-jre-alpine

# Set working directory
WORKDIR /app

# Make config folder
RUN mkdir config

# Download the .jar file using wget
RUN wget -O JMusicBot-0.3.9.jar https://github.com/jagrosh/MusicBot/releases/download/0.3.9/JMusicBot-0.3.9.jar

# Copy the config.txt file into the container
COPY config.txt /app/config.txt

# Copy the entrypoint script to the container
COPY entrypoint.sh /app/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /app/entrypoint.sh

# Set the entrypoint to run the entrypoint script
ENTRYPOINT ["/app/entrypoint.sh"]
