#!/bin/bash

CURRENT_DIR=$(dirname "$SCRIPT")

pushd $CURRENT_DIR
wget https://starship.rs/install.sh
chmod 755 install.sh
./install.sh -b $HOME/.local/bin
rm -f install.sh
popd

sed -i '/### STARSHIP BLOCK START ###/,/### STARSHIP BLOCK END ###/d' $HOME/.zshrc
cat << 'EOF' >> $HOME/.zshrc
### STARSHIP BLOCK START ###
eval "$(starship init zsh)"
### STARSHIP BLOCK END ###
EOF