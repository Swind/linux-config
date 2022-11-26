#!/bin/bash

SOFTWARE_DIR=$HOME/Software
NODE_DIR=$SOFTWARE_DIR/node
NODE_URL=https://nodejs.org/dist/v18.12.1/node-v18.12.1-linux-x64.tar.xz
NODE_BASE_NAME="${NODE_URL##*/}"

echo "Removing $NODE_DIR"
rm -rf $NODE_DIR

pushd $SOFTWARE_DIR
wget $NODE_URL
tar -xvf $NODE_BASE_NAME
rm $NODE_BASE_NAME
mv "${NODE_BASE_NAME%.*.*}" node
popd

sed -i '/### NODE BLOCK START ###/,/### NODE BLOCK END ###/d' $HOME/.zshrc
cat << 'EOF' >> $HOME/.zshrc
### NODE BLOCK START ###
export PATH=$HOME/Software/node/bin:$PATH
### NODE BLOCK END ###
EOF
