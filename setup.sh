#!/bin/bash

echo "Update apt and install packages..."
sudo apt update
sudo apt install -y git zsh tmux exa

echo "Setting zsh..."
rm -f $HOME/.zshrc
ln -s $HOME/.myconfig/zsh/.zshrc $HOME/.zshrc
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
