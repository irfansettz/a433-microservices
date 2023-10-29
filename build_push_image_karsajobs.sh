#!/bin/bash

# Set GitHub username, repository name, and desired image tag
USERNAME="irfansettz"
REPOSITORY="karsajobs"
TAG="latest"

# Use the GITHUB_TOKEN environment variable
TOKEN="$GITHUB_TOKEN"

# Check if the GITHUB_TOKEN is set
if [ -z "$TOKEN" ]; then
  echo "Error: GITHUB_TOKEN environment variable is not set."
  exit 1
fi

# Authenticate Docker with GitHub Container Registry
echo "$TOKEN" | docker login ghcr.io -u $USERNAME --password-stdin

# Build the Docker image
docker build -t ghcr.io/$USERNAME/$REPOSITORY:$TAG .

# Push the Docker image to GitHub Container Registry
docker push ghcr.io/$USERNAME/$REPOSITORY:$TAG
