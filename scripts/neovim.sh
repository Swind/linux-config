#!/bin/bash
echo "neovim: build prerequisites"
sudo apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ \
  pkg-config unzip curl doxygen xclip btm luarocks ripgrep imagemagick
npm install -g tree-sitter-cli
npm install -g @mermaid-js/mermaid-cli

TARGET_DIR=$HOME/Software
NEOVIM_DIR=$TARGET_DIR/neovim
NEOVIM_VERSION=v0.11.2

mkdir -p "$TARGET_DIR"

if [ ! -d "$NEOVIM_DIR" ]; then
  git clone https://github.com/neovim/neovim "$NEOVIM_DIR"
else
  pushd "$NEOVIM_DIR" || exit
  git pull
  popd || exit
fi

pushd "$NEOVIM_DIR" || exit
git pull
git checkout $NEOVIM_VERSION
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
popd || exit

#sudo apt-get install software-properties-common
#sudo add-apt-repository ppa:neovim-ppa/unstable
#sudo apt-get update
#sudo apt-get install neovim
