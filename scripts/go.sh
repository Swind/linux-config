#!/bin/bash

source $(dirname "$0")/lib.sh
ARCH=$(detect_arch)

SOFTWARE_DIR=$HOME/Software
GO_DIR=$SOFTWARE_DIR/go
GO_URL=https://go.dev/dl/go1.19.3.linux-${ARCH}.tar.gz
GO_BASE_NAME="${GO_URL##*/}"

echo "Removing $GO_DIR"
rm -rf $GO_DIR

pushd $SOFTWARE_DIR
wget $GO_URL
tar -zxvf $GO_BASE_NAME
rm $GO_BASE_NAME
popd

sed -i '/### GO BLOCK START ###/,/### GO BLOCK END ###/d' $HOME/.zshrc
cat << 'EOF' >> $HOME/.zshrc
### GO BLOCK START ###
export GOBIN=$HOME/.local/bin
export PATH=$HOME/Software/go/bin:$PATH
### GO BLOCK END ###
EOF
