CONFIG_HOME=.myconfig

#Log 
warn(){
	echo "$1" >&2
}

die(){
	warn "$1"
	exit 1
}

######################################################################
#
#   Main
#
######################################################################

[ -e "~/.myconfig" ] && die "~/myconfig already exists."

cd ~

#Checkout my config
git clone git://github.com/Swind/linux-config.git "$CONFIG_HOME"

#Link all config files
ln -s $CONFIG_HOME/.vim .vim
ln -s .vim/.vimrc .vimrc
ln -s $CONFIG_HOME/zsh/.zshrc .zshrc
ln -s $CONFIG_HOME/tmux/.tmux.conf .tmux.conf
ln -s $CONFIG_HOME/hg/.hgrc .hgrc

#install vundle for vim
git clone https://github.com/gmarik/vundle.git $CONFIG_HOME/.vim/bundle/vundle

#install antigen
git clone https://github.com/zsh-users/antigen.git $CONFIG_HOME/zsh/antigen

#Set git environment
git config --global user.email "swind@code-life.info"
git config --global user.name "Swind"

echo "Configuration files has been installed."
cd "$CONFIG_HOME"
