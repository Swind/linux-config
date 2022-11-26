#!/bin/bash

sudo apt install -y python3 python3-pip
pip3 install thefuck --user

sed -i '/### THE_FUCK BLOCK START ###/,/### THE_FUCK BLOCK END ###/d' $HOME/.zshrc
cat << 'EOF' >> $HOME/.zshrc
### THE_FUCK BLOCK START ###
eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias FUCK)
### THE_FUCK BLOCK END ###
EOF
