Plug 'python-mode/python-mode', {'branch': 'develop'}

let g:pymode = 1
let g:pymode_indent = 1 
let g:pymode_doc = 0

let g:pymode_virtualenv = 1

let g:pymode_folding = 0 
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

"let g:pymode_lint_checkers = ['pep8', 'mccabe']
let g:pymode_lint_ignore = "E501,W"

let g:pymode_rope = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_autoimport = 1 
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_completion_bind = '<C-l>'
" Override go-to.definition key shortcut to Ctrl-]
let g:pymode_rope_goto_definition_bind = "<C-]>"


" Override run current python file key shortcut to Ctrl-Shift-e
let g:pymode_run_bind = "<C-S-e>"

" Override view python doc key shortcut to Ctrl-Shift-d
let g:pymode_doc_bind = "<C-S-d>"

