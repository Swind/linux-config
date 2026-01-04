#!/bin/bash

source $(dirname "$0")/lib.sh
PKG_MANAGER=$(detect_pkg_manager)

if [ "$PKG_MANAGER" = "apt" ]; then
    # Ubuntu/Debian VS Code installation
    sudo apt install -y curl

    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

    sudo apt-get install -y apt-transport-https
    sudo apt-get update
    sudo apt-get install -y code

elif [ "$PKG_MANAGER" = "dnf" ]; then
    # Fedora VS Code installation
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

    dnf check-update
    sudo dnf install -y code

else
    echo "Unsupported package manager: $PKG_MANAGER"
    exit 1
fi
