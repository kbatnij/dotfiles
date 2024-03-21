#!/usr/bin/env bash

install_kitty() {
    echo "Checking for Kitty terminal installation..."
    if command -v kitty &>/dev/null; then
        echo "Kitty is already installed. Skipping..."
        return
    fi

    echo "Installing Kitty terminal..."
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin \
        && ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/ \
        && cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/ \
        && sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|" ~/.local/share/applications/kitty.desktop \
        || { echo "Failed to install Kitty."; exit 1; }
}

setup_kitty_config_symlink() {
    echo "Setting up Kitty configuration symlink..."
    local custom_config_path="$PWD/.config/kitty/kitty.conf"
    local default_config_path="$HOME/.config/kitty/kitty.conf"

    mkdir -p "$HOME/.config/kitty"

    [[ -L "$default_config_path" || -f "$default_config_path" ]] && rm -f "$default_config_path"
    
    if [[ -f "$custom_config_path" ]]; then
        ln -s "$custom_config_path" "$default_config_path"
        echo "Kitty configuration symlinked successfully."
    else
        echo "Custom Kitty configuration file not found. Please check the path."
        exit 1
    fi
}

install_dracula_theme() {
    echo "Installing Dracula theme for Kitty..."
    local theme_url="https://github.com/dracula/kitty/archive/master.zip"
    local temp_zip="/tmp/dracula_kitty.zip"
    local temp_dir="/tmp/dracula_kitty"

    wget $theme_url -O $temp_zip \
        && unzip $temp_zip -d $temp_dir \
        && cp $temp_dir/kitty-master/dracula.conf $temp_dir/kitty-master/diff.conf ~/.config/kitty/ \
        || { echo "Failed to install Dracula theme."; exit 1; }

    rm -rf $temp_zip $temp_dir
    echo "Dracula theme installed successfully."
}

main() {
    install_kitty
    setup_kitty_config_symlink
    install_dracula_theme
}

main
