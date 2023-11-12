#!/bin/bash

echo "Installing depot_tools"
mkdir -p $HOME/Software
pushd $HOME/Software
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
popd

echo "Get the code"
mkdir -p $HOME/Program
pushd $HOME/Program
mkdir chromium && cd chromium
fetch --nohooks chromium
cd src
./build/install-build-deps.sh
gclient runhooks
gn gen out/Default
