#!/bin/bash

VERSION=2.63.2
WORKING_DIR=/tmp/gh
URL="https://github.com/cli/cli/releases/download/v2.63.2/gh_""$VERSION""_linux_amd64.tar.gz"

mkdir -p $WORKING_DIR
wget $URL -O $WORKING_DIR/gh.tar.gz

pushd $WORKING_DIR || exit 1
tar -zxvf gh.tar.gz
cp "./gh_""$VERSION""_linux_amd64/bin/gh" "$HOME/.local/bin"
"$HOME/.local/bin/gh" extension install github/gh-copilot
