CONFIG_HOME=.myconfig

warn(){
	echo "$1" >&2
}

die(){
	warn "$1"
	exit 1
}

[ -e "~/.myconfig" ] && die "~/myconfig already exists."

cd ~

#Checkout my config
git clone git://github.com/Elsvent/Shell-Config.git "$CONFIG_HOME"

#install vundle for vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

#install oh-my-zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

ln -s $CONFIG_HOME/.vim/.vimrc .vimrc
ln -s $CONFIG_HOME/.zshrc .zshrc
ln -s $CONFIG_HOME/.tmux.conf .tmux.conf
ln -s $CONFIG_HOME/hg/.hgrc .hgrc

#Set git environment
git config --global user.email "elsvent@gmail.com"
git config --global user.name "Elsvent Hong"

echo "Configuration files has been installed."
cd "$CONFIG_HOME"
