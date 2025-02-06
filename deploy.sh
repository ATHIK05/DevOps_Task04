#!/bin/bash

# Exit on error
set -e

# Check Kubernetes authentication and context
kubectl config use-context minikube || { echo "Failed to set Minikube context"; exit 1; }

# Docker build and push process
echo "⚙️ Building the Docker image..."
docker build -t mohamedathikr/devopstask04 .

# Docker login (remove password in real-world usage)
echo "🔑 Logging in to Docker Hub..."
echo "qwerty786!A" | docker login -u "mohamedathikr" --password-stdin

echo "🚀 Pushing the Docker image to Docker Hub..."
docker push mohamedathikr/devopstask04

# Deploy to Minikube without validation if needed
echo "📦 Deploying to Minikube..."
kubectl apply -f deployment.yaml --validate=false

echo "🌍 Exposing the deployment..."
kubectl apply -f service.yaml --validate=false

# Get the service URL
echo "🔗 Fetching the service URL..."
SERVICE_URL=$(minikube service newdevops --url)

echo "Service URL: $SERVICE_URL"

echo "✅ Deployment completed successfully!"
