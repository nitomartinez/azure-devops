#!/bin/bash
set -e

# Variables (should be set by CI or manually)
ACR_LOGIN_SERVER=$1
ACR_USERNAME=$2
ACR_PASSWORD=$3
IMAGE_NAME=$4

if [[ -z "$ACR_LOGIN_SERVER" || -z "$ACR_USERNAME" || -z "$ACR_PASSWORD" || -z "$IMAGE_NAME" ]]; then
  echo "Usage: $0 <acr_login_server> <acr_username> <acr_password> <image_name>"
  exit 1
fi

echo "Logging in to Azure Container Registry..."
echo "$ACR_PASSWORD" | docker login "$ACR_LOGIN_SERVER" -u "$ACR_USERNAME" --password-stdin

echo "Tagging image..."
docker tag "$IMAGE_NAME" "$ACR_LOGIN_SERVER/$IMAGE_NAME"

echo "Pushing image..."
docker push "$ACR_LOGIN_SERVER/$IMAGE_NAME"

echo "Image pushed successfully."
