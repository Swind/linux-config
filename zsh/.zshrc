# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv virtualenv-init -)"
fi

##################################################
#
# Linux config
#
#################################################
export TERM=xterm-256color

export JAVA_HOME="/usr/lib/jvm/default-java"

# Config user bin path
export PATH=$HOME/.local/bin:$HOME/bin:$PATH

# depot_tools
export PATH=$HOME/Software/depot_tools:$PATH

# NodeJS
export PATH=$HOME/Software/node/bin:$HOME/.yarn/bin:$PATH

# android-studio
export PATH=$HOME/Software/android-studio/bin:$PATH

# Flutter
export PATH=$HOME/Software/flutter/bin:$PATH

# node
export PATH=$HOME/Software/node/bin:$PATH

# go
export PATH=$HOME/Software/go/bin:$PATH

# The fuck
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval $(thefuck --alias)

function prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new `printf %q "$PREV"`"
}

# Autojump
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt INC_APPEND_HISTORY_TIME

DISABLE_UNTRACKED_FILES_DIRTY="true"

# Rust
source $HOME/.cargo/env

# sccache
export SCCACHE_CACHE_SIZE="32G"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias fall="find . -name '*.cpp' -o -name '*.h' | sed 's| |\\ |g' | xargs clang-format -i"
eval "$(navi widget zsh)"
