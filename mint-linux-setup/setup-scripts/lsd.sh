#!/usr/bin/env bash

echo "Checking lsd installation..."
if ! command -v lsd &> /dev/null; then
    echo "Installing lsd..."
    cargo install lsd
else
    echo "lsd is already installed. Skipping..."
fi

# Define the custom configuration file path for lsd
CUSTOM_LSD_CONFIG_PATH="$PWD/.config/lsd/config.yaml"

# Ensure the ~/.config/lsd directory exists
mkdir -p "$HOME/.config/lsd"

# The destination path for the symlink
DEFAULT_LSD_CONFIG_PATH="$HOME/.config/lsd/config.yaml"

# Check if the symlink or a configuration file already exists
if [ -L "$DEFAULT_LSD_CONFIG_PATH" ] || [ -f "$DEFAULT_LSD_CONFIG_PATH" ]; then
    echo "lsd configuration or symlink already exists. Removing it..."
    rm -f "$DEFAULT_LSD_CONFIG_PATH"
fi

# Ensure the custom configuration file exists before creating a symlink
if [ -f "$CUSTOM_LSD_CONFIG_PATH" ]; then
    # Create a symlink to the custom configuration file
    ln -s "$CUSTOM_LSD_CONFIG_PATH" "$DEFAULT_LSD_CONFIG_PATH"
    echo "lsd configuration successfully migrated to use the custom configuration file."
else
    echo "Custom lsd configuration file not found at $CUSTOM_LSD_CONFIG_PATH. Please check the path."
fi
