#!/bin/bash

# Exit on error
set -e

# Set the correct kubeconfig if needed (Adjust path as necessary)
export KUBECONFIG=$HOME/.kube/config  # Update path if required

# Ensure Minikube context is selected
echo "🔄 Switching to Minikube context..."
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

# Deploy to Minikube using a YAML file without validation
echo "📦 Deploying to Minikube..."
kubectl apply -f deployment.yaml --validate=false
kubectl apply -f service.yaml --validate=false

# Expose the deployment using a YAML file (if needed)
echo "🌍 Exposing the deployment..."
kubectl apply -f service.yaml



echo "✅ Deployment completed successfully!"
