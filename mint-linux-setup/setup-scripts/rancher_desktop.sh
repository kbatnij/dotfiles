#!/usr/bin/env bash

# Check if Rancher Desktop is already installed
echo "Checking Rancher Desktop installation..."
if ! command -v rancher-desktop &> /dev/null; then
    curl -s https://download.opensuse.org/repositories/isv:/Rancher:/stable/deb/Release.key | gpg --dearmor | sudo dd status=none of=/usr/share/keyrings/isv-rancher-stable-archive-keyring.gpg
    echo 'deb [signed-by=/usr/share/keyrings/isv-rancher-stable-archive-keyring.gpg] https://download.opensuse.org/repositories/isv:/Rancher:/stable/deb/ ./' | sudo dd status=none of=/etc/apt/sources.list.d/isv-rancher-stable.list
    sudo apt update
    sudo apt install rancher-desktop
else
    echo "Rancher Desktop is already installed. Skipping..."
fi