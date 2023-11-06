#!/bin/bash

ZSHRC_PATH=$HOME/.config/zsh/.zshrc
CURRENT_DIR=$(dirname "$SCRIPT")
FZF_PATH=$HOME/.fzf

rm -rf $FZF_PATH
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

$HOME/.fzf/install --all

sed -i '/### FZF BLOCK START ###/,/### FZF BLOCK END ###/d' $ZSHRC_PATH
cat << 'EOF' >> $ZSHRC_PATH
### FZF BLOCK START ###
export FZF_DEFAULT_COMMAND='fd --type file --color=always --follow --hidden --exclude .git'
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
### FZF BLOCK END ###
EOF
