#!/bin/bash

ZSHRC_PATH=$HOME/.config/zsh/.zshrc
CURRENT_DIR=$(dirname "$SCRIPT")
TARGET_DIR=$HOME/Software
ANDROID_DIR=$TARGET_DIR/android-sdk

# Install Android SDK Platform Tools
# https://developer.android.com/studio/releases/platform-tools

# Check if Android SDK Platform Tools is installed
if [ -d "$ANDROID_DIR" ]; then
	echo "Android SDK Platform Tools is already installed"
	exit 0
fi

# Download Android SDK Platform Tools
mkdir -p $ANDROID_DIR
pushd $ANDROID_DIR
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
unzip platform-tools-latest-linux.zip
rm -f platform-tools-latest-linux.zip

wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip
unzip commandlinetools-linux-9477386_latest.zip
rm -f commandlinetools-linux-9477386_latest.zip
popd

sed -i '/### ANDROID_SDK BLOCK START ###/,/### ANDROID_SDK BLOCK END ###/d' $ZSHRC_PATH
cat <<'EOF' >>$ZSHRC_PATH
### ANDROID_SDK BLOCK START ###
export PATH=$HOME/Software/android-sdk/platform-tools:$HOME/Software/android-sdk/cmdline-tools/bin:$PATH
export ANDROID_HOME=$HOME/Software/android-sdk
### ANDROID_SDK BLOCK END ###
EOF
