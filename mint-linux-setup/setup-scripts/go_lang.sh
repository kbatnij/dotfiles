#!/usr/bin/env bash

# Install Go if not already installed
echo "Checking Go installation..."
if ! command -v go &> /dev/null; then
    echo "Installing go..."
    sudo add-apt-repository ppa:longsleep/golang-backports -y
    sudo apt update
    sudo apt install golang-go -y
    echo "golang installed successfully."
else
    echo "golang is already installed. Skipping..."
fi
