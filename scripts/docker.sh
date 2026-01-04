#!/bin/bash

source $(dirname "$0")/lib.sh
PKG_MANAGER=$(detect_pkg_manager)

if [ "$PKG_MANAGER" = "apt" ]; then
    # Ubuntu/Debian Docker installation
    sudo apt-get remove docker docker-engine docker.io containerd runc
    sudo apt-get install \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

    sudo mkdir -m 0755 -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

elif [ "$PKG_MANAGER" = "dnf" ]; then
    # Fedora Docker installation
    sudo dnf -y remove docker docker-common docker-selinux docker-engine
    sudo dnf -y install dnf-plugins-core

    sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
    sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

else
    echo "Unsupported package manager: $PKG_MANAGER"
    exit 1
fi

sudo groupadd docker 2>/dev/null || true
sudo gpasswd -a $USER docker
