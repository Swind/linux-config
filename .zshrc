################################################
#
#   ZSH Config
#
################################################
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="carlcarl"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

# Customize to your needs...
export PATH=/usr/lib64/qt-3.3/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin
source $ZSH/oh-my-zsh.sh

# Platform Check

platform="unknown"
unamestr=$(uname)
if [[ "$unamestr" == "Linux" ]]; then
    platform="linux"
elif [[ "$unamestr" == "Darwin" ]]; then
    platform="mac"
elif [[ "$unamestr" == "FreeBSD" ]]; then
    platform="freebsd"
fi

if [[ $platform == "freebsd" ]]; then
    echo '===== Config FreeBSD Environment ====='
    echo 'Setup Clang CC and CXX to /usr/bin/clang and /usr/bin/clang++'
    export CC=/usr/bin/gcc
    export CXX=/usr/bin/g++
    export LC_ALL=zh_TW.UTF-8
    export LANG=zh_TW.UTF-8
    export PATH=/usr/local/libexec/ccache:$PATH
    export CCACHE_PATH=/usr/bin:/usr/local/bin
    export CCACHE_DIR=/var/tmp/ccache
    export CCACHE_LOGFILE=/var/log/ccache.log
fi

#My Alias
alias cmsg="echo /dev/null > /var/log/messages"
alias vmsg="vim /var/log/messages"
alias tmsg="tail -f /var/log/messages"
alias l="la"

#For FreeBSD
if [[ "$unamestr" == "FreeBSD" ]]; then
    alias rz="lrz"
    alias sz="lsz"
fi

export TERM=xterm-256color
