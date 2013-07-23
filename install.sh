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
git clone git://github.com/Swind/linux-config.git "$CONFIG_HOME"

#install vundle for vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

#clone ulctip package
git clone https://github.com/hychen/ucltip.git $CONFIG_HOME/python/ucltip_src

#install oh-my-zsh
#curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh


ln -s $CONFIG_HOME/.vim .vim
ln -s .vim/.vimrc .vimrc
ln -s $CONFIG_HOME/zsh/.zshrc .zshrc
ln -s $CONFIG_HOME/tmux/.tmux.conf .tmux.conf

#Set git environment
git config --global user.email "idle.swind@gmail.com"
git config --global user.name "Swind"

echo "Configuration files has been installed."
cd "$CONFIG_HOME"
