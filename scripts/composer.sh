#!/bin/bash

CURRENT_DIR=$(dirname "$SCRIPT")

sudo apt install -y php-cli unzip curl

pushd $CURRENT_DIR
curl -sS https://getcomposer.org/installer -o composer-setup.php
php composer-setup.php --install-dir=$HOME/.local/bin --filename=composer
