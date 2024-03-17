#!/usr/bin/env bash

# Check if Argo CD CLI is installed
echo "Checking Argo CD CLI installation..."
if ! command -v argocd &> /dev/null; then
    echo "Argo CD CLI is not installed. Installing..."
    # Download the latest Argo CD CLI binary
    curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
    # Install the binary with execute permissions
    sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
    # Remove the downloaded file
    rm argocd-linux-amd64
    echo "Argo CD CLI installed successfully."
else
    echo "Argo CD CLI is already installed. Skipping..."
fi
