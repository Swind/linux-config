#!/bin/bash

ZSHRC_PATH=$HOME/.config/zsh/.zshrc
source $(dirname "$0")/lib.sh
ARCH=$(detect_arch)
#if ARCH is x86 convert it to x64
if [ "$ARCH" == "x86" ]; then
    ARCH="x64"
fi

SOFTWARE_DIR=$HOME/Software
NODE_DIR=$SOFTWARE_DIR/node
NODE_VERSION=22.16.0
NODE_URL=https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-${ARCH}.tar.xz
NODE_BASE_NAME="${NODE_URL##*/}"

echo "Removing $NODE_DIR"
rm -rf $NODE_DIR

pushd $SOFTWARE_DIR
wget $NODE_URL
tar -xvf $NODE_BASE_NAME
rm $NODE_BASE_NAME
mv "${NODE_BASE_NAME%.*.*}" node
popd

sed -i '/### NODE BLOCK START ###/,/### NODE BLOCK END ###/d' $ZSHRC_PATH
cat << 'EOF' >> $ZSHRC_PATH
### NODE BLOCK START ###
export PATH=$HOME/Software/node/bin:$PATH
### NODE BLOCK END ###
EOF
