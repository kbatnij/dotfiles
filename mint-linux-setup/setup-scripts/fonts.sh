#!/usr/bin/env bash

install_nerd_font() {
    font_name=$1
    font_url=$2
    temp_dir="/tmp/${font_name}"

    echo "Installing ${font_name} Nerd Font..."

    # Check if the font is already installed
    if fc-list | grep -qi "${font_name} Nerd Font"; then
        echo "${font_name} Nerd Font is already installed. Skipping..."
        return
    fi

    mkdir -p ~/.local/share/fonts

    if [[ $font_url == *.zip ]]; then
        file_extension=".zip"
    elif [[ $font_url == *.tar.gz ]] || [[ $font_url == *.tar.xz ]]; then
        file_extension=".tar.xz"
    else
        echo "Unsupported font archive format."
        return 1
    fi

    wget -O "${temp_dir}${file_extension}" "${font_url}" || { echo "Failed to download ${font_name}."; return 1; }

    if [ $file_extension == ".zip" ]; then
        unzip "${temp_dir}.zip" -d "${temp_dir}" && cp "${temp_dir}"/*.{otf,ttf} ~/.local/share/fonts/ && rm -rf "${temp_dir}" "${temp_dir}.zip"
    elif [ $file_extension == ".tar.xz" ]; then
        tar -xf "${temp_dir}.tar.xz" -C "${temp_dir}" && cp "${temp_dir}"/*.{otf,ttf} ~/.local/share/fonts/ && rm -rf "${temp_dir}" "${temp_dir}.tar.xz"
    fi

    fc-cache -fv >/dev/null

    echo "${font_name} Nerd Font installed successfully."
}

main() {
    install_nerd_font "FiraCode" "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip"
    install_nerd_font "JetBrainsMono" "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.tar.xz"
}

main
