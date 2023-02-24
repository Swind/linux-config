#!/bin/bash

ZSHRC_PATH=$HOME/.config/zsh/.zshrc
PYENV_ROOT=$(pyenv root)

echo "Installing pyenv-virtualenv..."
git clone https://github.com/pyenv/pyenv-virtualenv.git $PYENV_ROOT/plugins/pyenv-virtualenv

sed -i '/### PYENV_VIRTUALENV BLOCK START ###/,/### PYENV_VIRTUALENV BLOCK END ###/d' $ZSHRC_PATH
cat << 'EOF' >> $ZSHRC_PATH
### PYENV_VIRTUALENV BLOCK START ###
eval "$(pyenv virtualenv-init -)"
### PYENV_VIRTUALENV BLOCK END ###
EOF
