#!/bin/bash

ZSHRC_PATH=$HOME/.config/zsh/.zshrc
CURRENT_DIR=$(dirname "$SCRIPT")

pushd $CURRENT_DIR
wget https://starship.rs/install.sh
chmod 755 install.sh
mkdir -p $HOME/.local/bin
./install.sh -y -b $HOME/.local/bin
rm -f install.sh
popd

sed -i '/### STARSHIP BLOCK START ###/,/### STARSHIP BLOCK END ###/d' $ZSHRC_PATH
cat << 'EOF' >> $HOME/.zshrc
### STARSHIP BLOCK START ###
eval "$(starship init zsh)"
### STARSHIP BLOCK END ###
EOF

# Generate starship config
starship preset no-nerd-font -o ~/.config/starship.toml
