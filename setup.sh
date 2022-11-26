#!/bin/bash

echo "Update apt and install packages..."
sudo apt update
sudo apt install -y git zsh tmux

echo "Setting zsh..."
rm -f $HOME/.zshrc
ln -s $HOME/.myconfig/zsh/.zshrc $HOME/.zshrc
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

echo "Installing pyenv..."
# Install Python build dependencies
sudo apt update; sudo apt install make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv

sed '/### PYENV BLOCK START ###,/### PYENV BLOCK END ###/d' $HOME/.zshrc
cat << EOF >> $HOME/.zshrc
### PYENV BLOCK START ###
export PYENV_ROOT="$HOME/.pyenv
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
### PYENV BLOCK END ###
EOF
