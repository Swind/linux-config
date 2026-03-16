#!/bin/bash
ZSHRC_PATH=$HOME/.config/zsh/.zshrc

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mkasberg/ghostty-ubuntu/HEAD/install.sh)"

sed -i '/### GHOSTTY BLOCK START ###/,/### GHOSTTY BLOCK END ###/d' $ZSHRC_PATH
cat << 'EOF' >> $ZSHRC_PATH
### GHOSTTY BLOCK START ###
alias gkb='ghostty +list-keybinds --plain | less'
alias gkf='ghostty +list-keybinds --plain | fzf'
### GHOSTTY BLOCK END ###
EOF
