Plug 'w0rp/ale'

" assuming you're using vim-plug: https://github.com/junegunn/vim-plug
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

Plug 'rhysd/vim-clang-format'


" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
au User Ncm2Plugin call ncm2#register_source({
        \ 'name' : 'css',
        \ 'priority': 9,
        \ 'subscope_enable': 1,
        \ 'scope': ['css','scss'],
        \ 'mark': 'css',
        \ 'word_pattern': '[\w\-]+',
        \ 'complete_pattern': ':\s*',
        \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
        \ })

" Switch between source and header
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" To get syntax highlighting and tab settings for gyp(i) and DEPS files,
" add the following to your .vimrc file:
"     so /path/to/src/tools/vim/filetypes.vim

augroup filetype
        au! BufRead,BufNewFile *.gyp    set filetype=python expandtab tabstop=2 shiftwidth=2
        au! BufRead,BufNewFile *.gypi   set filetype=python expandtab tabstop=2 shiftwidth=2
        au! BufRead,BufNewFile DEPS     set filetype=python expandtab tabstop=2 shiftwidth=2
augroup END

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'cpp': ['clangd-6.0'],
    \ 'c': ['clangd-6.0'],
    \ 'go': ['go-langserver', '-gocodecompletion']
    \ }

"let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
"let g:LanguageClient_settingsPath = '/home/swind/.config/nvim/settings.json'
set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()

nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

autocmd FileType c,cpp setlocal omnifunc=LanguageClient#complete
autocmd FileType go setlocal omnifunc=LanguageClient#complete
autocmd FileType python setlocal omnifunc=LanguageClient#complete
autocmd FileType rust setlocal omnifunc=LanguageClient#complete
autocmd FileType typescript,javascript setlocal omnifunc=LanguageClient#complete
autocmd FileType dart setlocal omnifunc=LanguageClient#complete
autocmd FileType reason setlocal omnifunc=LanguageClient#complete

"let g:clang_format#code_style="chromium"

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
