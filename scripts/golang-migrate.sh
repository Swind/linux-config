#!/bin/bash

ZSHRC_PATH=$HOME/.config/zsh/.zshrc
source $(dirname "$0")/lib.sh
ARCH=$(detect_arch)
# if ARCH is x86 convert it to amd64
if [ "$ARCH" == "x86" ]; then
    ARCH="amd64"
fi

PLATFORM=linux
VERSION=v4.15.2

SOFTWARE_DIR=$HOME/Software
TARGET_DIR=$SOFTWARE_DIR/golang-migrate
URL=https://github.com/golang-migrate/migrate/releases/download/$VERSION/migrate.$PLATFORM-$ARCH.tar.gz
BASE_NAME="${URL##*/}"


echo "Removing ${TARGET_DIR} if exists"
rm -rf $TARGET_DIR
mkdir -p $TARGET_DIR

pushd $TARGET_DIR
wget $URL
tar -zxvf $BASE_NAME
rm $BASE_NAME
popd

sed -i '/### GO_LANG_MIGRATE BLOCK START ###/,/### GO_LANG_MIGRATE BLOCK END ###/d' $ZSHRC_PATH
cat << 'EOF' >> $ZSHRC_PATH
### GO_LANG_MIGRATE BLOCK START ###
export PATH=$HOME/Software/golang-migrate:$PATH
### GO_LANG_MIGRATE BLOCK END ###
EOF
