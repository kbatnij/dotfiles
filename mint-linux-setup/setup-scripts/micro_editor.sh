#!/usr/bin/env bash

# Install Micro if not already installed
MICRO_VERSION="2.0.13"
MICRO_ARCH="amd64"
echo "Checking Micro installation..."
if ! command -v micro &> /dev/null; then
    echo "Downloading and installing Micro ${MICRO_VERSION}..."
    wget https://github.com/zyedidia/micro/releases/download/v${MICRO_VERSION}/micro-${MICRO_VERSION}-${MICRO_ARCH}.deb -O micro.deb
    sudo dpkg -i micro.deb
    sudo apt-get install -f
    rm micro.deb
else
    echo "Micro is already installed. Skipping..."
fi