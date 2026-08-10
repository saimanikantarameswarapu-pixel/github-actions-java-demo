#!/bin/bash

set -e

IMAGE="saimanikantarameswarapu/github-actions-java-demo:latest"
CONTAINER="java-demo"

echo "Pulling latest Docker image..."
docker pull $IMAGE

echo "Stopping old container..."
docker stop $CONTAINER || true

echo "Removing old container..."
docker rm $CONTAINER || true

echo "Starting new container..."
docker run -d \
  --name $CONTAINER \
  -p 8081:8080 \
  $IMAGE

echo "Deployment completed successfully!"

docker ps
