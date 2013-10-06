CONFIG_HOME=.myconfig

#####################################################
#   Function
#####################################################

log_warn()
{
    echo "$1" >&2
}

die()
{
    log_warn "$1"
    exit 1
}

link_if_not_existing()
{
    [ -f $1 ] && ln -s $1 $2
}

#####################################################
#   Link config files
#####################################################
config_files= ".vim .vimrc zsh/.zshrc tmux/.tmux.conf hg/.hgrc"

link_config_files()
{
    for i in config_files; do
        if [ -f "$CONFIG_HOME/$filename" ]; then
            echo "Create symbolic link $filename ..."
            ln -s "$CONFIG_HOME/$filename" $(basename $i)
        fi

    done
}

#####################################################
#   Main
#####################################################
cd ~

#If the .myconfig is existing, don't start the instsall.
[ -e "$CONFIG_HOME" ] && die "$CONFIG_HOME already exists."

#Checkout my config
git clone git://github.com/Swind/linux-config.git "$CONFIG_HOME"

#Create symbolic link for config files
link_config_files

#install vundle for vim
git clone https://github.com/gmarik/vundle.git $CONFIG_HOME/.vim/bundle/vundle

#install antigen

git clone https://github.com/zsh-users/antigen.git $CONFIG_HOME/zsh/antigen

#Set git environment
git config --global user.email "swind@code-life.info"
git config --global user.name "Swind"

echo "Configuration files has been installed."
cd "$CONFIG_HOME"
