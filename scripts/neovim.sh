#!/bin/bash

source $(dirname "$0")/lib.sh
PKG_MANAGER=$(detect_pkg_manager)

echo "neovim: build prerequisites"
if [ "$PKG_MANAGER" = "apt" ]; then
    sudo apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen xclip
elif [ "$PKG_MANAGER" = "dnf" ]; then
    sudo dnf install -y ninja-build gettext libtool autoconf automake cmake gcc-c++ pkg-config unzip curl doxygen xclip
else
    echo "Unsupported package manager: $PKG_MANAGER"
    exit 1
fi

TARGET_DIR=$HOME/Software
NEOVIM_DIR=$TARGET_DIR/neovim
NEOVIM_VERSION=v0.11.4

mkdir -p $TARGET_DIR

if [ ! -d $NEOVIM_DIR ];then
  git clone https://github.com/neovim/neovim $NEOVIM_DIR
else
  pushd $NEOVIM_DIR
  git pull
  popd
fi

pushd $NEOVIM_DIR
git pull
git checkout $NEOVIM_VERSION
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
popd

#sudo apt-get install software-properties-common
#sudo add-apt-repository ppa:neovim-ppa/unstable
#sudo apt-get update
#sudo apt-get install neovim
