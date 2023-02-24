#!/bin/bash

ZSHRC_PATH=$HOME/.myconfig/zsh/.zshrc

cargo install --locked navi

sed -i '/### NAVI BLOCK START ###/,/### GO BLOCK END ###/d' $ZSHRC_PATH
cat << 'EOF' >> $ZSHRC_PATH
### NAVI BLOCK START ###
eval "$(navi widget zsh)"
### NAVI BLOCK END ###
EOF
