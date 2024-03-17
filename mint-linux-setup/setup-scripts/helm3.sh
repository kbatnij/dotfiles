#!/usr/bin/env bash

# Check if Helm 3 is installed
echo "Checking Helm 3 installation..."
if ! command -v helm &> /dev/null; then
    echo "Helm 3 is not installed. Installing Helm 3..."

    # Downloading Helm 3 installation script
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3

    if [ $? -ne 0 ]; then
        echo "Failed to download Helm 3 installation script."
        exit 1
    fi

    # Setting execute permission
    chmod 700 get_helm.sh

    # Running the installation script
    ./get_helm.sh

    if [ $? -eq 0 ]; then
        echo "Helm 3 installed successfully."
    else
        echo "Helm 3 installation failed."
        exit 1
    fi

    # Clean up
    rm get_helm.sh

else
    echo "Helm 3 is already installed. Skipping..."
fi
