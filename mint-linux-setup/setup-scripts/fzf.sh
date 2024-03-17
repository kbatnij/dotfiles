#!/usr/bin/env bash

# Install fzf if not already installed
echo "Checking fzf installation..."
if ! command -v fzf &> /dev/null; then
    echo "Installing fzf..."
    # Clone the fzf repository
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    # Run the install script
    ~/.fzf/install --key-bindings --completion --no-bash --no-zsh 
    echo "fzf installed successfully."
else
    echo "fzf is already installed. Skipping..."
fi
