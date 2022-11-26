#!/bin/bash
echo "neovim: build prerequisites"
sudo apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen

TARGET_DIR=$HOME/Software
NEOVIM_DIR=$TARGET_DIR/neovim

mkdir -p $TARGET_DIR

if [ ! -d $NEOVIM_DIR ];then
  git clone https://github.com/neovim/neovim $NEOVIM_DIR
fi

pushd $NEOVIM_DIR
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
popd

#sudo apt-get install software-properties-common
#sudo add-apt-repository ppa:neovim-ppa/unstable
#sudo apt-get update
#sudo apt-get install neovim
