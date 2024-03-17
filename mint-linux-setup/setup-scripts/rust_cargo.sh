#!/usr/bin/env bash

echo "Checking Rust and Cargo installation..."
if ! command -v rustc &> /dev/null; then
    echo "Installing Rust and Cargo..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
else
    echo "Rust and Cargo are already installed. Skipping..."
fi