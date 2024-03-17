#!/usr/bin/env bash

echo "Installing Fira Code Nerd Font..."
# Check if the font is already installed
if fc-list | grep -qi "FiraCode Nerd Font"; then
    echo "Fira Code Nerd Font is already installed. Skipping..."
else
    # Create the directory for local fonts if it doesn't exist
    mkdir -p ~/.local/share/fonts

    # Download Fira Code Nerd Font into the fonts directory
    wget -O ~/.local/share/fonts/FiraCode-Regular-Nerd-Font-Complete.otf "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip"

    # Unzip the font (this assumes the zip contains .otf or .ttf files directly in the root)
    unzip ~/.local/share/fonts/FiraCode.zip -d ~/.local/share/fonts/
    rm ~/.local/share/fonts/FiraCode.zip  # Clean up zip file

    # Update the font cache
    fc-cache -fv

    echo "Fira Code Nerd Font installed successfully."
fi