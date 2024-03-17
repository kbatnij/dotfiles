#!/usr/bin/env bash

# Check if Flameshot is installed
echo "Checking Flameshot installation..."
if ! command -v flameshot &> /dev/null; then
    echo "Flameshot is not installed. Installing Flameshot..."
    
    # Update package lists to ensure you can install the latest version
    sudo apt update
    
    # Install Flameshot without requiring interaction
    sudo apt install flameshot -y
    
    if [ $? -eq 0 ]; then
        echo "Flameshot installed successfully."
    else
        echo "Flameshot installation failed."
        exit 1
    fi
else
    echo "Flameshot is already installed. Skipping..."
fi
