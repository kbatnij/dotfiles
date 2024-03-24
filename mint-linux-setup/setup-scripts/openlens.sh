#!/usr/bin/env bash

# OpenLens installation script
OPENLENS_VERSION="6.5.2-366"
OPENLENS_ARCH="amd64"

echo "Checking OpenLens installation..."
if ! command -v openlens &> /dev/null; then
    echo "Downloading and installing OpenLens ${OPENLENS_VERSION}..."
    wget https://github.com/MuhammedKalkan/OpenLens/releases/download/v${OPENLENS_VERSION}/OpenLens-${OPENLENS_VERSION}.${OPENLENS_ARCH}.deb -O openlens.deb
    sudo dpkg -i openlens.deb
    sudo apt-get install -f
    rm openlens.deb
else
    echo "OpenLens is already installed. Skipping..."
fi
