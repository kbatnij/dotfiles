#!/usr/bin/env bash

KIND_VERSION=v0.22.0

if ! command -v kind &> /dev/null; then
    # For AMD64 / x86_64
    [ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/${KIND_VERSION}/kind-linux-amd64
    # For ARM64
    [ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/${KIND_VERSION}/kind-linux-arm64
    chmod +x ./kind
    sudo mv ./kind /usr/local/bin/kind
fi

echo "kind installed successfully."
