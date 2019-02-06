" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Use fzf to find the file by name
nmap <C-p> :FZF<CR>

" NERDTree
Plug 'scrooloose/nerdtree'
nnoremap <silent><C-e> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let NERDTreeIgnore = ['\.pyc$', '__pycache__']

" Ag
Plug 'rking/ag.vim'
