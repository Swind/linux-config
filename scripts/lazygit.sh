#!/bin/bash

ZSHRC_PATH=$HOME/.config/zsh/.zshrc
SOFTWARE_DIR=$HOME/Software
LAZYGIT_DIR=$SOFTWARE_DIR/lazygit

# If lazygit directory exists, remove it
if [ -d "$LAZYGIT_DIR" ]; then
    echo "Removing $LAZYGIT_DIR"
    rm -rf $LAZYGIT_DIR
fi

# Create lazygit directory
mkdir -p $LAZYGIT_DIR

pushd $LAZYGIT_DIR

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit

popd

sed -i '/### LAZYGIT BLOCK START ###/,/### LAZYGIT BLOCK END ###/d' $ZSHRC_PATH
cat << 'EOF' >> $ZSHRC_PATH
### LAZYGIT BLOCK START ###
export PATH=$HOME/Software/lazygit:$PATH
### LAZYGIT BLOCK END ###
EOF
