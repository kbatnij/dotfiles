#!/usr/bin/env bash

echo "Starting setup..."

# Update system
echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install and configure Git
./setup-scripts/git.sh

# Install fonts
./setup-scripts/fonts.sh

# Install Micro editor
./setup-scripts/micro_editor.sh

# Install Rust and Cargo
./setup-scripts/rust_cargo.sh

# Install golang
./setup-scripts/go_lang.sh

# Install lsd
./setup-scripts/lsd.sh

# Install and configure Starship prompt
./setup-scripts/starship_prompt.sh

# Install and configure Kitty terminal
./setup-scripts/kitty_terminal.sh

# Install Flameshot
./setup-scripts/flameshot_screenshot.sh

# Install kubectl
./setup-scripts/kubectl.sh

# Install Rancher Desktop
./setup-scripts/rancher_desktop.sh

# Install kind
./setup-scripts/kind_k8.sh

# Install Helm 3
./setup-scripts/helm3.sh

# Install Helm 3
./setup-scripts/argocd.sh

# Install terraform
./setup-scripts/terraform.sh

# Install bat
./setup-scripts/bat_cat.sh

# Add custom.bash_env.sh configs to bashrc
CUSTOM_ENV_PATH="$(dirname "$(realpath "$0")")/custom.bash_env.sh"
if ! grep -qxF "source \"$CUSTOM_ENV_PATH\"" "$HOME/.bashrc"; then
    echo "Adding sourcing of custom.bash_env.sh to $BASH_RC..."
    echo "source \"$CUSTOM_ENV_PATH\"" >> "$HOME/.bashrc"
    echo "Sourcing of custom.bash_env.sh added to $HOME/.bashrc"
else
    echo "The sourcing of custom.bash_env.sh is already present in $HOME/.bashrc"
fi
