#!/usr/bin/env bash

install_bat() {
    echo "Checking for bat installation..."
    if command -v bat &>/dev/null; then
        echo "bat is already installed. Skipping..."
        return
    fi

    echo "Attempting to install bat..."
    if sudo apt-get update && sudo apt-get install -y bat; then
        sudo ln -s /usr/bin/batcat /usr/bin/bat
        echo "bat installed successfully."
    else
        echo "Failed to install bat via the package manager."
        return 1
    fi
}

setup_bat_config_symlink() {
    echo "Setting up bat configuration symlink..."
    local custom_config_path="$PWD/.config/bat/config"
    local default_config_path="$HOME/.config/bat/config"

    mkdir -p "$HOME/.config/bat"

    if [[ -L "$default_config_path" ]] || [[ -f "$default_config_path" ]]; then
        echo "A bat configuration or symlink already exists. Removing it..."
        rm -f "$default_config_path"
    fi

    if [[ -f "$custom_config_path" ]]; then
        ln -s "$custom_config_path" "$default_config_path"
        echo "bat configuration successfully symlinked."
    else
        echo "Custom bat configuration file not found. Please check the path."
        exit 1
    fi
}

main() {
    install_bat
    setup_bat_config_symlink
}

main
