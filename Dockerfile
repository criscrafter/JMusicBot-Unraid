# Base image
FROM eclipse-temurin:8-jdk

# Update the packages in the image
RUN apk update && apk upgrade

# Set working directory
WORKDIR /app

# Make config folder
RUN mkdir config

# Download the .jar file using curl and wget
RUN apk add --no-cache curl
RUN response=$(curl -s https://api.github.com/repos/jagrosh/MusicBot/releases/latest) && \
    download_url=$(echo "$response" | grep -o '"browser_download_url": "[^"]*' | grep -o 'https://.*\.jar') && \
    filename=$(echo "$response" | grep -o '"name": "[^"]*' | grep -o '[^"]*\.jar') && \
    wget -O "$filename" "$download_url"

# Copy the config.txt file into the container
COPY config.txt /app/config.txt

# Copy the entrypoint script to the container
COPY entrypoint.sh /app/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /app/entrypoint.sh

# Set the entrypoint to run the entrypoint script
ENTRYPOINT ["/app/entrypoint.sh"]
