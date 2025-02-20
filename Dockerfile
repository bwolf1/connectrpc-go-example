# Start from the latest Golang base image
# FROM golang:latest
FROM golang:1.23-alpine AS builder

# Add Maintainer Info
LABEL maintainer="example@example.com"

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go mod and sum files 
COPY go.mod go.sum ./

# Download all dependencies. 
RUN go mod download

# Copy the binary from the local environment to the Working Directory inside the container 
COPY greetservice .

# This container exposes port 8080 to the outside world
EXPOSE 8080

# Run the binary program
CMD ["./greetservice"]