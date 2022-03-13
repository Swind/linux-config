local utils = require('utils')

-- set leader to ','
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- move around tabs. conflict with the original screen top/bottom
-- comment theme out if you want the original H/L
-- go to prev tab
utils.map('', '<S-H>', 'gT')
-- go to next tab
utils.map('', '<S-L>', 'gt')
-- new tab
utils.map('', '<C-t><C-t>', ':tabnew<CR>')
-- close tab
utils.map('', '<C-t><C-w>', ':tabclose<CR>')

-- ,/ turn off search highlighting
utils.map('n', '<leader>/', ':nohl<CR>')

-- fast saving with <leader> and s
utils.map('n', '<C-s>', ':w<CR>')
utils.map('i', '<C-s>', '<C-c>:w<CR>')

-- split screen
utils.map('n', '<leader>sv', ':vsp<CR>')
utils.map('n', '<leader>sh', ':sp<CR>')
utils.map('n', '<leader>sc', '<C-w>c') -- close current split window
utils.map('n', '<leader>so', '<C-w>o') -- close other split windows

-- move between screens
utils.map('n', '<A-h>', '<C-w>h')
utils.map('n', '<A-j>', '<C-w>j')
utils.map('n', '<A-k>', '<C-w>k')
utils.map('n', '<A-l>', '<C-w>l')

