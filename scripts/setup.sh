#!/bin/bash

source $(dirname "$0")/lib.sh

OS=$(detect_os)
PKG_MANAGER=$(detect_pkg_manager)

echo "Detected OS: $OS"
echo "Package manager: $PKG_MANAGER"

echo "Update packages and install git zsh tmux..."
if [ "$PKG_MANAGER" = "apt" ]; then
    sudo apt update
    sudo apt install -y git zsh tmux
elif [ "$PKG_MANAGER" = "dnf" ]; then
    sudo dnf update -y
    sudo dnf install -y git zsh tmux
else
    echo "Unsupported package manager: $PKG_MANAGER"
    exit 1
fi

echo "Cloning linux-config from github"
# check $HOME/.myconfig is exist, if not, clone it
if [ ! -d $HOME/.myconfig ]; then
	git clone git@github.com:Swind/linux-config.git $HOME/.myconfig
fi

# link $HOME/.myconfig to $HOME/.config
# if $HOME/.config is exist, remove it
if [ -d $HOME/.config ]; then
	rm -rf $HOME/.config
fi
ln -s $HOME/.myconfig $HOME/.config

echo "Setup default folders..."
mkdir -p $HOME/Software
mkdir -p $HOME/Program

echo "Setting zsh..."
rm -f $HOME/.zshrc
ln -s $HOME/.myconfig/zsh/.zshrc $HOME/.zshrc

echo "Setting tmux..."
rm -f $HOME/.tmux.conf
ln -s $HOME/.myconfig/tmux/.tmux.conf $HOME/.tmux.conf

pushd $HOME/.myconfig/scripts

install_scripts="go.sh node.sh rust.sh neovim.sh astronvim.sh docker.sh eza.sh starship.sh zoxide.sh vscode.sh navi.sh keygen.sh fzf.sh font.sh fd.sh"
for script in $install_scripts; do
	echo "Installing $script..."
	zsh -c "source $HOME/.zshrc && $HOME/.myconfig/scripts/$script"
done
