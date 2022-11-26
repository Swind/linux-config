#!/bin/bash

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

sed -i '/### RUST BLOCK START ###/,/### RUST BLOCK END ###/d' $HOME/.zshrc
cat << 'EOF' >> $HOME/.zshrc
### RUST BLOCK START ###
source $HOME/.cargo/env
### RUST BLOCK END ###
EOF
