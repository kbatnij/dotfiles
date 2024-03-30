#!/usr/bin/env bash

wget -O - https://apt.corretto.aws/corretto.key | sudo gpg --dearmor --yes -o /usr/share/keyrings/corretto-keyring.gpg && \
echo "deb [signed-by=/usr/share/keyrings/corretto-keyring.gpg] https://apt.corretto.aws stable main" | sudo tee /etc/apt/sources.list.d/corretto.list

# Update apt repositories
echo "Updating apt repositories..."
sudo apt-get update

# Install Amazon Corretto JDK 17 if not already installed
if ! java -version 2>&1 | grep -q 'OpenJDK 17'; then
    echo "Installing Amazon Corretto JDK 17..."
    sudo apt-get install -y java-17-amazon-corretto-jdk
else
    echo "Amazon Corretto JDK 17 is already installed. Skipping..."
fi

# Install Amazon Corretto JDK 21 if not already installed
# Note: As of my last update, JDK 21 might not be directly available or named differently. Please adjust the package name accordingly.
if ! java -version 2>&1 | grep -q 'OpenJDK 21'; then
    echo "Installing Amazon Corretto JDK 21..."
    sudo apt-get install -y java-21-amazon-corretto-jdk
else
    echo "Amazon Corretto JDK 21 is already installed. Skipping..."
fi
