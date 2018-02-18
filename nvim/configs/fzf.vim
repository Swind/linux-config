" FZF

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Use fzf to find the file by name
nmap <C-p> :FZF<CR>
