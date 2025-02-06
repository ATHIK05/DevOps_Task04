#!/bin/bash

# Exit on error
set -e

# Docker build process
echo "⚙️ Building the Docker image..."
docker build -t mohamedathikr/devopstask04 .

# Docker login securely
echo "🔑 Logging in to Docker Hub..."
echo "qwerty786!A" | docker login -u "mohamedathikr" --password-stdin

# Push the new image
echo "🚀 Pushing the Docker image to Docker Hub..."
docker push mohamedathikr/devopstask04

# Deploy to Minikube using a YAML file
echo "📦 Deploying to Minikube..."
kubectl apply -f deployment.yaml

# Expose the deployment using a YAML file
echo "🌍 Exposing the deployment..."
kubectl apply -f service.yaml

# Get the service URL
echo "🔗 Fetching the service URL..."
minikube service newdevops --url

echo "✅ Deployment completed successfully!"
