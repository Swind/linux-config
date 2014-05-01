CONFIG_HOME=.myconfig

#####################################################
#   Function
#####################################################
print_line() { #{{{
printf "%$(tput cols)s\n"|tr ' ' '-'
} #}}}
print_title() { #{{{
clear
print_line
echo -e "# ${Bold}$1${Reset}"
print_line
echo ""
} #}}}
print_info() { #{{{
#Console width number
T_COLS=`tput cols`
echo -e "${Bold}$1${Reset}\n" | fold -sw $(( $T_COLS - 18 )) | sed 's/^/\t/'
} #}}}
print_warning() { #{{{
T_COLS=`tput cols`
echo -e "${BYellow}$1${Reset}\n" | fold -sw $(( $T_COLS - 1 ))
} #}}}
print_danger() { #{{{
T_COLS=`tput cols`
echo -e "${BRed}$1${Reset}\n" | fold -sw $(( $T_COLS - 1 ))
} #}}}

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
config_files= "vim/.vim vim/.vim/.vimrc tmux/.tmux.conf hg/.hgrc git/.gitconfig"

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

echo "Configuration files has been installed."
cd "$CONFIG_HOME"
