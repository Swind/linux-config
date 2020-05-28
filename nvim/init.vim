if empty(glob('~/.myconfig/nvim//autoload/plug.vim'))
  silent !curl -fLo ~/.myconfig/nvim//autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Plug {
call plug#begin()
" }

"====== UI ====="
Plug 'tomasr/molokai'
Plug 'bling/vim-airline'
source ~/.config/nvim/configs/incsearch.vim "highlights all pattern matches

"====== Syntax ======"
Plug 'cespare/vim-toml' " Vim syntax for TOML

"====== Git ======"
Plug 'airblade/vim-gitgutter' "Shows a git diff in the 'gutter'
Plug 'tpope/vim-fugitive'

"Coc - Intellisense engine for neovim
source ~/.config/nvim/configs/autocomplete.vim

"JavaScript
source ~/.config/nvim/configs/javascript.vim

"File managers
source ~/.config/nvim/configs/filemanagers.vim

"RTags
source ~/.config/nvim/configs/rtags.vim

"Align
source ~/.config/nvim/configs/align.vim

"Format
source ~/.config/nvim/configs/format.vim

"Snippets
source ~/.config/nvim/configs/snippets.vim

call plug#end()

" General Setting

set nocompatible	" not compatible with the old-fashion vi mode
set bs=2		" allow backspacing over everything in insert mode
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set autoread		" auto read when file is changed from outside
set nu                  " show line number
set foldlevelstart=8

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

syntax on		" syntax highlight
set hlsearch		" search highlighting

" terminal color settings
set guifont="Monaco for Powerline":h20
set background=dark 
set t_Co=256
set cursorline        " highlight current line
set cursorcolumn

colors molokai

set clipboard=unnamed	" yank to the system register (*) by default
set showmatch		" Cursor shows matching ) and }
set showmode		" Show current mode
set wildchar=<TAB>	" start wild expansion in the command line using <TAB>
set wildmenu            " wild char completion menu

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

set autoindent		" auto indentation
set incsearch		" incremental search
set nobackup		" no *~ backup files
set copyindent		" copy the previous indentation on autoindenting
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab		" insert tabs on the start of a line according to context

" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" TAB setting{
   set expandtab        "replace <TAB> with spaces
   set softtabstop=2
   set shiftwidth=2
   set tabstop=2
"   au FileType Makefile set noexpandtab
"}      							
"

"--------------------------------------------------------------------------- 
" USEFUL SHORTCUTS
"--------------------------------------------------------------------------- 
" set leader to ,
let mapleader=","
let g:mapleader=","

" open the error console
map <leader>cc :botright cope<CR> 
" move to next error
map <leader>] :cn<CR>
" move to the prev error
map <leader>[ :cp<CR>

" --- move around splits {
" move to and maximize the below split 
map <C-J> <C-W>j<C-W>_
" move to and maximize the above split 
map <C-K> <C-W>k<C-W>_
" move to and maximize the left split 
nmap <c-h> <c-w>h<c-w><bar>
" move to and maximize the right split  
nmap <c-l> <c-w>l<c-w><bar>
set wmw=0                     " set the min width of a window to 0 so we can maximize others 
set wmh=0                     " set the min height of a window to 0 so we can maximize others
" }

" move around tabs. conflict with the original screen top/bottom
" comment them out if you want the original H/L
" go to prev tab
map <S-H> gT
" go to next tab
map <S-L> gt

" new tab
map <C-t><C-t> :tabnew<CR>
" close tab
map <C-t><C-w> :tabclose<CR>

" ,/ turn off search highlighting
nmap <leader>/ :nohl<CR>

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

map <F10> mzgg=G`z

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

" :cd. change working directory to that of the current file
cmap cd. lcd %:p:h

autocmd! bufwritepost init.vim source %

autocmd FileType c,cpp,java,php,py autocmd BufWritePre <buffer> %s/\s\+$//e
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

"Highlight unwanted spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
