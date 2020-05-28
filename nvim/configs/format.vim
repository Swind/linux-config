Plug 'rhysd/vim-clang-format'

let g:clang_format#code_style="chromium"

" map to <Leader>cf in C++ code
autocmd FileType c,h,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,h,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

" Toggle auto formatting:
" nmap <Leader>C :ClangFormatAutoToggle<CR>

"format on saving
"let g:clang_format#auto_format=1
