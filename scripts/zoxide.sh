#!/bin/bash
#
ZSHRC_PATH=$HOME/.config/zsh/.zshrc

curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

sed -i '/### ZOXIDE BLOCK START ###/,/### GO BLOCK END ###/d' $ZSHRC_PATH
cat << 'EOF' >> $ZSHRC_PATH
### ZOXIDE BLOCK START ###
PATH=$HOME/.local/bin:$PATH
eval "$(zoxide init zsh)"
### ZOXIDE BLOCK END ###
EOF
