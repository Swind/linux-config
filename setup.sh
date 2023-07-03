#!/bin/bash

echo "Update apt and install packages..."
sudo apt update
sudo apt install -y git zsh tmux

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
echo "Installing pyenv and pyenv virtualenv..."
./pyenv.sh
zsh -c "source $HOME/.zshrc && $HOME/.myconfig/scripts/pyenv-virtualenv.sh"

# Check python 3.10.6 is installed, if not, install it
if [ ! -d $HOME/.pyenv/versions/3.10.6 ]; then
  zsh -c "source $HOME/.zshrc && pyenv install 3.10.6"
fi

# Check virtualenv neovim is exist, if not, create it
if [ ! -d $HOME/.pyenv/versions/neovim ]; then
  zsh -c "source $HOME/.zshrc && pyenv virtualenv 3.10.6 neovim"
fi

install_scripts="go.sh node.sh rust.sh neovim.sh astronvim.sh docker.sh exa.sh starship.sh zoxide.sh vscode.sh navi.sh keygen.sh fzf.sh font.sh fd.sh"
for script in $install_scripts; do
  echo "Installing $script..."
  zsh -c "source $HOME/.zshrc && $HOME/.myconfig/scripts/$script"
done
