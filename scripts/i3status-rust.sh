#!/bin/bash
sudo apt install -y libssl-dev libsensors-dev libpulse-dev libnotmuch-dev pandoc
pushd $HOME/Software
# If i3status-rust is not exist, clone it
if [ ! -d "$HOME/Software/i3status-rust" ]; then
  git clone https://github.com/greshake/i3status-rust
fi
cd i3status-rust
cargo install --path . --locked
./install.sh
