" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Use fzf to find the file by name
nmap <C-p> :FZF<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
"let $FZF_DEFAULT_COMMAND = 'lolcate --db chromium87'

" NERDTree
Plug 'scrooloose/nerdtree'
nnoremap <silent><C-e> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let NERDTreeIgnore = ['\.pyc$', '__pycache__']
