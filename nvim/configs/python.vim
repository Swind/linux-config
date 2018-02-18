Plug 'klen/python-mode'

let g:pymode_indent = 0
let g:pymode_folding = 0 
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

"let g:pymode_lint_checkers = ['pep8', 'mccabe']
let g:pymode_lint_ignore = "E501,W"
" Override go-to.definition key shortcut to Ctrl-]
let g:pymode_rope_goto_definition_bind = "<C-]>"

" Override run current python file key shortcut to Ctrl-Shift-e
let g:pymode_run_bind = "<C-S-e>"

" Override view python doc key shortcut to Ctrl-Shift-d
let g:pymode_doc_bind = "<C-S-d>"

