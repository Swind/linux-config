#!/bin/bash

FZF_PATH=$HOME/.fzf

rm -rf $FZF_PATH
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

$HOME/.fzf/install
