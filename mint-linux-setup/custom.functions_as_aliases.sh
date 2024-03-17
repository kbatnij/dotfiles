#!/usr/bin/env bash

function updateall () {
    echo "Updating Rust tools..."
    if command -v rustup &> /dev/null; then
        rustup update
    else
        echo "Rustup is not installed."
    fi

    echo "Updating Cargo packages..."
    if command -v cargo &> /dev/null; then
        cargo install --list | grep '^[a-zA-Z0-9_-]* v' | cut -d ' ' -f 1 | xargs -I {} cargo install {}
    else
        echo "Cargo is not installed."
    fi

    echo "Updating system packages..."
    sudo apt update && sudo apt upgrade -y

    echo "Updating Flatpaks..."
    flatpak update

    echo "Removing unused system packages..."
    sudo apt autoremove -y

    echo "Updating Starship..."
    if command -v starship &> /dev/null; then
        sudo sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -y > /dev/null
    else
        echo "Starship is not installed."
    fi

    echo "Updating Kitty..."
    if command -v kitty &> /dev/null; then
        curl -fsSL https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n >/dev/null 2>&1
    else
        echo "Kitty is not installed."
    fi

    echo "All updates complete!"
}
