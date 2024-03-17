#!/usr/bin/env bash

# Install Starship if not already installed
echo "Checking Starship installation..."
if ! command -v starship &> /dev/null; then
    echo "Installing Starship..."
    curl -sS https://starship.rs/install.sh | sh
else
    echo "Starship is already installed. Skipping..."
fi

echo "Configuring Starship with custom settings..."

# Define the custom configuration file path
CUSTOM_CONFIG_PATH="$PWD/.config/starship.toml"

# Ensure the ~/.config directory exists
mkdir -p "$HOME/.config"

# The destination path for the symlink
DEFAULT_CONFIG_PATH="$HOME/.config/starship.toml"

# Check if the symlink or a configuration file already exists
if [ -L "$DEFAULT_CONFIG_PATH" ] || [ -f "$DEFAULT_CONFIG_PATH" ]; then
    echo "A starship.toml configuration or symlink already exists. Removing it..."
    rm -f "$DEFAULT_CONFIG_PATH"
fi

# Ensure the custom configuration file exists before creating a symlink
if [ -f "$CUSTOM_CONFIG_PATH" ]; then
    # Create a symlink to the custom configuration file
    ln -s "$CUSTOM_CONFIG_PATH" "$DEFAULT_CONFIG_PATH"
    echo "Starship configuration successfully migrated to use the custom configuration file."
else
    echo "Custom Starship configuration file not found at $CUSTOM_CONFIG_PATH. Please check the path."
fi
