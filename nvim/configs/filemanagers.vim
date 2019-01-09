" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
" nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <silent><C-e> :NERDTreeTabsToggle<CR>


let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let NERDTreeIgnore = ['\.pyc$', '__pycache__']

" Ag
Plug 'rking/ag.vim'
