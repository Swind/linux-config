#!/bin/bash
TARGET_DIR=$HOME/Software/i3status-rust

mkdir -p $TARGET_DIR

pushd $TARGET_DIR
git clone https://github.com/greshake/i3status-rust
cd i3status-rust
cargo install --path . --locked
./install.sh
popd
