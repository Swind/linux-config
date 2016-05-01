################################################
#
#   ZSH Config
#
################################################

MY_CONFIG_HOME=~/.myconfig
source $MY_CONFIG_HOME/zsh/.zshrc.antigen

# Customize to your needs...
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin

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
alias vim=nvim


##################################################
#
# Linux config 
#
#################################################
export ANDROID_SDK_HOME="/home/swind/Software/android-sdk-linux"
export TERM=xterm-256color
export PATH="$PATH:$ANDROID_SDK_HOME/tools:$ANDROID_SDK_HOME/platform-tools:$ANDROID_SDK_HOME/build-tools/23.0.3"

export ANDROID_HOME="/home/swind/Software/android-sdk-linux"
export JAVA_HOME="/usr/lib/jvm/java-8-jdk"

export GOPATH=$HOME/Program/Go

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval $(thefuck --alias)
