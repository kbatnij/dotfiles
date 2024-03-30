#!/usr/bin/env bash

# Install Go if not already installed
echo "Checking jEnv installation..."
if ! command -v jenv &> /dev/null; then
    echo "Installing jEnv..."
    git clone https://github.com/jenv/jenv.git ~/.jenv
    export PATH=$PATH:$HOME/.jenv/bin
    eval "$(jenv init -)"
    jenv enable-plugin export
    echo "jEnv installed successfully."
else
    echo "jEnv is already installed. Skipping..."
fi
