#!/bin/bash

# Exit script on first error
set -e

# Build Go binary and deploy the Docker image to Docker Hub
./build.sh

# Start the cluster and apply the deployment configuration
minikube start
kubectl apply -f deployment.yaml

# Wait for the deployment to be ready
kubectl wait --for=condition=available --timeout=600s deployment/greetservice-deployment

# Forward the port to access the service
kubectl port-forward deployment/greetservice-deployment 8080:8080
