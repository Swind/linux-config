if empty(glob('~/.myconfig/nvim//autoload/plug.vim'))
  silent !curl -fLo ~/.myconfig/nvim//autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
