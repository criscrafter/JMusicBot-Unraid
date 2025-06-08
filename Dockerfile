# Base image
FROM eclipse-temurin:11-jre

# Update the packages in the image
RUN apt-get update

# Set working directory
WORKDIR /app

# Make config folder
RUN mkdir config

# Download the .jar file using curl and wget
RUN apt-get install -y curl
RUN response=$(curl -s https://api.github.com/repos/SeVile/MusicBot/releases/latest) && \
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
