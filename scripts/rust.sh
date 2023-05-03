#!/bin/bash
ZSHRC_PATH=$HOME/.config/zsh/.zshrc
CURRENT_DIR=$(dirname "$SCRIPT")

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

sed -i '/### RUST BLOCK START ###/,/### RUST BLOCK END ###/d' $ZSHRC_PATH
cat << 'EOF' >> $ZSHRC_PATH
### RUST BLOCK START ###
source $HOME/.cargo/env
### RUST BLOCK END ###
EOF
