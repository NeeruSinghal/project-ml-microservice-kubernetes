#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=neerusinghal/api

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deployment api --image=$dockerpath
name=`kubectl get pods --no-headers -o custom-columns=":metadata.name"`

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward $name 8000:80
