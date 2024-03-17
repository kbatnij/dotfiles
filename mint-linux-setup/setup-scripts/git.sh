#!/usr/bin/env bash

echo "Checking Git installation..."
if ! command -v git &> /dev/null; then
    echo "Installing Git..."
    sudo apt-get install -y git
else
    echo "Git is already installed. Skipping..."
fi

# Check if Git user name and email are already set
gituser=$(git config --global user.name)
gitemail=$(git config --global user.email)

if [ -z "$gituser" ]; then
    read -p "Enter your Git user name: " gituser
    git config --global user.name "$gituser"
else
    echo "Git user name already configured as: $gituser"
fi

if [ -z "$gitemail" ]; then
    read -p "Enter your Git email: " gitemail
    git config --global user.email "$gitemail"
else
    echo "Git email already configured as: $gitemail"
fi
git config --global init.defaultBranch main

echo "Installation completed."
echo "Git is now configured to use 'main' as the default branch for new repositories."
echo "Git configured for user: $gituser with email: $gitemail."