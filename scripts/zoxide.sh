#!/bin/bash

curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

sed -i '/### ZOXIDE BLOCK START ###/,/### GO BLOCK END ###/d' $HOME/.zshrc
cat << 'EOF' >> $HOME/.zshrc
### ZOXIDE BLOCK START ###
eval "$(zoxide init zsh)"
### ZOXIDE BLOCK END ###
EOF
