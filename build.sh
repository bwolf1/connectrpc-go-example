#!/bin/bash

# Exit script on first error
set -e

# Build Go binary
echo "Building Go binary..."
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o greetservice ./cmd/main.go

# Login to Docker Hub
echo "Logging into Docker Hub..."
docker login -u bwolf2 --password-stdin < ~/bwolf2_password.txt
if [ $? -ne 0 ]; then
    echo "Docker login failed. Please check your credentials."
    exit 1
fi

# Build Docker image
echo "Building Docker image..."
docker build -t bwolf2/greetservice .

# Push image to Docker Hub
echo "Pushing Docker image to Docker Hub..."
docker push bwolf2/greetservice

# Removing binary file from local
echo "Cleaning up..."
rm greetservice

echo "Build complete!"