################################################
#
#   ZSH Config
#
################################################

MY_CONFIG_HOME=~/.myconfig
source $MY_CONFIG_HOME/zsh/.zshrc.antigen

# Customize to your needs...
export PATH=/usr/lib64/qt-3.3/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin

################################################
#
# Platform Check
#
################################################

platform="unknown"
unamestr=$(uname)
if [[ "$unamestr" == "Linux" ]]; then
    platform="linux"
elif [[ "$unamestr" == "Darwin" ]]; then
    platform="mac"
elif [[ "$unamestr" == "FreeBSD" ]]; then
    platform="freebsd"
fi

##################################################
#
#   General Setting
#
##################################################
alias l="ls -lah"


##################################################
#
# For FreeBSD Environment
#
#################################################
C_COMPILER=gcc
CXX_COMPILER=g++

if [[ $platform == "freebsd" ]]; then
    echo '===== Config FreeBSD Environment ====='
    export CC=/usr/bin/$C_COMPILER
    export CXX=/usr/bin/$CXX_COMPILER
    echo 'C Compiler   : $CC'
    echo 'C++ Compiler : $CXX'

    #My Alias
    alias cmsg="echo /dev/null > /var/log/messages"
    alias vmsg="vim /var/log/messages"
    alias tmsg="tail -f /var/log/messages"

    alias rz="lrz"
    alias sz="lsz"

    #For Go
    export GOROOT=/usr/local/go
    export GOPATH=/root/Go
    export PATH=$PATH:/usr/local/go/bin:$GOROOT/bin:$GOPATH/bin
fi

export TERM=xterm-256color
