#!/bin/bash

# Exit on error
set -e

# Set the correct kubeconfig if needed
export KUBECONFIG=$HOME/.kube/config  # Update path if required

# Ensure Minikube context is selected
kubectl config use-context minikube

# Docker build process
echo "⚙️ Building the Docker image..."
docker build -t mohamedathikr/devopstask04 .

# Docker login securely
echo "🔑 Logging in to Docker Hub..."
echo "qwerty786!A" | docker login -u "mohamedathikr" --password-stdin

# Push the new image
echo "🚀 Pushing the Docker image to Docker Hub..."
docker push mohamedathikr/devopstask04

kubevtl apply -f deployment.yaml
echo "🌍 Exposing the deployment..."
kubectl apply -f service.yaml

# Get the service URL
echo "🔗 Fetching the service URL..."
minikube service newdevops 

echo "✅ Deployment completed successfully!"
