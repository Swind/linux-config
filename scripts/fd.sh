#!/bin/bash

ZSHRC_PATH=$HOME/.config/zsh/.zshrc
CURRENT_DIR=$(dirname "$SCRIPT")

cargo install fd-find

sed -i '/### FD BLOCK START ###/,/### FD BLOCK END ###/d' $ZSHRC_PATH
cat << 'EOF' >> $ZSHRC_PATH
### FD BLOCK START ###
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"
### FD BLOCK END ###
EOF
