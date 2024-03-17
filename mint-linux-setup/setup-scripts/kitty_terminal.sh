#!/usr/bin/env bash

echo "Checking Kitty terminal installation..."
if ! command -v kitty &> /dev/null; then
    echo "Installing Kitty terminal..."
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
    # Create a symbolic link to add kitty to PATH (assuming ~/.local/bin is in your PATH)
    ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
    # Copy the desktop file to the applications directory to integrate Kitty with your system's applications menu
    cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
    # Update the icon path in the kitty.desktop file
    sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|" ~/.local/share/applications/kitty.desktop
else
    echo "Kitty is already installed. Skipping..."
fi

# Define the custom configuration file path
CUSTOM_KITTY_CONFIG_PATH="$PWD/.config/kitty/kitty.conf"

# Ensure the ~/.config directory exists
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.config/kitty"

# The destination path for the symlink
DEFAULT_KITTY_CONFIG_PATH="$HOME/.config/kitty/kitty.conf"

# Check if the symlink or a configuration file already exists
if [ -L "$DEFAULT_KITTY_CONFIG_PATH" ] || [ -f "$DEFAULT_KITTY_CONFIG_PATH" ]; then
    echo "Kitty configuration or symlink already exists. Removing it..."
    rm -f "$DEFAULT_KITTY_CONFIG_PATH"
fi

# Ensure the custom configuration file exists before creating a symlink
if [ -f "$CUSTOM_KITTY_CONFIG_PATH" ]; then
    # Create a symlink to the custom configuration file
    ln -s "$CUSTOM_KITTY_CONFIG_PATH" "$DEFAULT_KITTY_CONFIG_PATH"
    echo "Kitty configuration successfully migrated to use the custom configuration file."
else
    echo "Custom Kitty configuration file not found at $CUSTOM_KITTY_CONFIG_PATH. Please check the path."
fi
