#!/bin/bash

# Use Node.js base image
FROM --platform=linux/amd64 node:18-alpine 

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app
COPY . .

# Expose the backend port
EXPOSE 9999

# Start the backend server
CMD ["node", "src/server.js"]
