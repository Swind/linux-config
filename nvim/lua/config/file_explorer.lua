local utils = require('utils')
-------------------------------------------------------------------------
-- file explorer
-------------------------------------------------------------------------
require'nvim-tree'.setup {
  -- close when closing file
  auto_close = true,
  -- doesn't show git status
  git = {
    enable = false
  }
}

utils.map('n', '<C-e>', ':NvimTreeToggle<CR>')

-------------------------------------------------------------------------
-- fuzzy finder
-------------------------------------------------------------------------
utils.map('', '<C-p>', '<cmd>Telescope find_files<CR>')
utils.map('', '<leader>fg', '<cmd>Telescope live_grep<CR>')
utils.map('', '<leader>fb', '<cmd>Telescope buffers<CR>')
utils.map('', '<leader>fh', '<cmd>Telescope help_tags<CR>')
