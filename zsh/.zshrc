################################################
#
#   ZSH Config
#
################################################
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

MY_CONFIG_HOME=~/.myconfig
source $MY_CONFIG_HOME/zsh/.zshrc.zplug

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
alias l="ls -lah --color=auto"
alias vim=nvim

##################################################
#
#  Python
#
##################################################
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH:/opt/toolchains/gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux/bin"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

##################################################
#
# Linux config 
#
#################################################
export TERM=xterm-256color

export ANDROID_SDK_HOME="/home/swind/Software/android-sdk-linux"
export ANDROID_HOME="/home/swind/Software/android-sdk-linux"
export PATH="$PATH:$ANDROID_SDK_HOME/tools/bin:$ANDROID_SDK_HOME/platform-tools:$ANDROID_SDK_HOME/build-tools/27.0.3:$ANDROID_SDK_HOME/ndk-bundle"
export PATH="$PATH:/opt/gradle/gradle-4.10.3/bin"

export JAVA_HOME="/usr/lib/jvm/default-java"

export GOPATH=$HOME/Program/Go
export PATH="$PATH:/home/swind/.local/bin:/home/swind/bin:/home/swind/Software/depot_tools:/home/swind/Software/go/bin:/home/swind/Program/Go/bin"

# The fuck
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval $(thefuck --alias)

function prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new `printf %q "$PREV"`"
}

# Pet
function pet-select() {
  BUFFER=$(pet search --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N pet-select
stty -ixon
bindkey '^s' pet-select

# NodeJS
export PATH="$PATH:/home/swind/Software/node/bin:/home/swind/.yarn/bin"

# Autojump
[[ -s /home/swind/.autojump/etc/profile.d/autojump.sh ]] && source /home/swind/.autojump/etc/profile.d/autojump.sh
