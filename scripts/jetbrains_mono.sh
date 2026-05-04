#!/bin/bash

# --- Configuration ---
FONT_URL="https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip"
FONT_NAME="JetBrainsMono"
INSTALL_DIR="$HOME/.local/share/fonts/$FONT_NAME"
TEMP_DIR=$(mktemp -d)

echo "--------------------------------------------------"
echo "🚀 Starting installation of $FONT_NAME"
echo "--------------------------------------------------"

# 1. Check for required dependencies
echo "🔍 Checking dependencies..."
for cmd in wget unzip fc-cache; do
    if ! command -v $cmd &> /dev/null; then
        echo "❌ Error: '$cmd' is not installed."
        echo "Please run: sudo apt update && sudo apt install wget unzip fontconfig"
        exit 1
    fi
done

# 2. Create the font directory
echo "📂 Creating installation directory at: $INSTALL_DIR"
mkdir -p "$INSTALL_DIR"

# 3. Download the font package
echo "📥 Downloading font package..."
if ! wget -q --show-progress "$FONT_URL" -O "$TEMP_DIR/fonts.zip"; then
    echo "❌ Error: Failed to download fonts from $FONT_URL"
    exit 1
fi

# 4. Unzip the package
echo "📦 Uncompressing files..."
unzip -q "$TEMP_DIR/fonts.zip" -d "$TEMP_DIR"

# 5. Install the .ttf files
# This targets the specific folder structure you provided
echo "🚚 Moving .ttf files to system font path..."
cp "$TEMP_DIR/fonts/ttf/"*.ttf "$INSTALL_DIR/"

# 6. Refresh font cache
echo "🔄 Refreshing font cache..."
fc-cache -f -v > /dev/null

# 7. Cleanup
echo "🧹 Cleaning up temporary files..."
rm -rf "$TEMP_DIR"

echo "--------------------------------------------------"
echo "✅ Installation successful!"
echo "You can now select '$FONT_NAME' in your IDE or Terminal."
echo "--------------------------------------------------"
