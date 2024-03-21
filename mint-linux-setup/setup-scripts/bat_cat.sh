#!/usr/bin/env bash

install_bat() {
    echo "Checking for bat installation..."
    if command -v bat &>/dev/null; then
        echo "bat is already installed. Skipping..."
        return
    fi

    echo "Attempting to install bat..."
    if sudo apt-get update && sudo apt-get install -y bat; then
        mkdir -p ~/.local/bin
        sudo ln -s /usr/bin/batcat /usr/bin/bat
        echo "bat installed successfully."
    else
        echo "Failed to install bat via the package manager."
        return 1
    fi
}

main() {
    install_bat
}

main
