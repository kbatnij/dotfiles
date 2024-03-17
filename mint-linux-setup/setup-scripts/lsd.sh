#!/usr/bin/env bash

echo "Checking lsd installation..."
if ! command -v lsd &> /dev/null; then
    echo "Installing lsd..."
    cargo install lsd
else
    echo "lsd is already installed. Skipping..."
fi
