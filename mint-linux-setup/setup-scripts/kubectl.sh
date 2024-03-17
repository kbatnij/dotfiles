#!/usr/bin/env bash

KUBECTL_VERSION=v1.29
# Install kubectl if not already installed
echo "Checking kubectl installation..."
if ! command -v kubectl &> /dev/null; then
    echo "Installing kubectl..."
    sudo apt-get update && sudo apt-get install -y apt-transport-https ca-certificates curl
    curl -fsSL https://pkgs.k8s.io/core:/stable:/${KUBECTL_VERSION}/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
    echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/${KUBECTL_VERSION}/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
    sudo apt-get update
    sudo apt-get install -y kubectl
    echo "kubectl installed successfully."
else
    echo "kubectl is already installed. Skipping..."
fi
