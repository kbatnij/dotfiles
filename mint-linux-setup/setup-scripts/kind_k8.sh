#!/usr/bin/env bash

KIND_VERSION=v0.22.0

# Check if Go is installed
if ! command -v go &> /dev/null; then
    echo "Go is not installed. Setting up Go..."
    ./go_lang.sh
fi

# Now check if Go is properly installed before proceeding
if ! command -v go &> /dev/null; then
    echo "Installation of Go failed or Go is not set up correctly in PATH. Cannot proceed with kind installation."
    exit 1
fi

# Check if kind is installed and install if doesnt exist
if ! command -v kind &> /dev/null; then
    echo "Installing kind ${KIND_VERSION}..."
    go install sigs.k8s.io/kind@${KIND_VERSION}
fi

echo "kind installed successfully."
