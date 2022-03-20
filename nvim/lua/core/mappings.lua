local M = {}

local config = require("core.utils").user_settings()

local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

-- Remap , as leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Normal --
-- Better window navigation
map("n", "<A-h>", "<C-w>h", opts)
map("n", "<A-j>", "<C-w>j", opts)
map("n", "<A-k>", "<C-w>k", opts)
map("n", "<A-l>", "<C-w>l", opts)

-- Resize with arrows
map("n", "<C-Up>", "<cmd>resize -2<CR>", opts)
map("n", "<C-Down>", "<cmd>resize +2<CR>", opts)
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

-- Navigate buffers
map("n", "<S-l>", "<cmd>bnext<CR>", opts)
map("n", "<S-h>", "<cmd>bprevious<CR>", opts)

-- Standard Operations
map("n", "<leader>w", "<cmd>w<CR>", opts)
map("n", "<leader>q", "<cmd>q<CR>", opts)
map("n", "<leader>c", "<cmd>Bdelete!<CR>", opts)
map("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Packer
map("n", "<leader>pc", "<cmd>PackerCompile<cr>", opts)
map("n", "<leader>pi", "<cmd>PackerInstall<cr>", opts)
map("n", "<leader>ps", "<cmd>PackerSync<cr>", opts)
map("n", "<leader>pS", "<cmd>PackerStatus<cr>", opts)
map("n", "<leader>pu", "<cmd>PackerUpdate<cr>", opts)

-- LSP
map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting_sync()<cr>", opts)
map("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
map("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
map("n", "<F4>", "<cmd>ClangdSwitchSourceHeader<cr>", opts)

-- NvimTree
if config.enabled.nvim_tree then
  map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)
  map("n", "<leader>o", "<cmd>NvimTreeFocus<CR>", opts)
end

-- GitSigns
if config.enabled.gitsigns then
  map("n", "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", opts)
  map("n", "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", opts)
  map("n", "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", opts)
  map("n", "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", opts)
  map("n", "<leader>gh", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", opts)
  map("n", "<leader>gr", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", opts)
  map("n", "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", opts)
  map("n", "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", opts)
  map("n", "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", opts)
end

-- Telescope
map("n", "<C-p>", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", opts)

map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", opts)
map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", opts)
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", opts)

map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", opts)
map("n", "<leader>fm", "<cmd>Telescope man_pages<CR>", opts)
map("n", "<leader>fr", "<cmd>Telescope registers<CR>", opts)
map("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", opts)
map("n", "<leader>fc", "<cmd>Telescope commands<CR>", opts)
map("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", opts)

-- Lspsaga
if config.enabled.lspsaga then
  map("n", "cd", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
  map("n", "ca", "<cmd>Lspsaga code_action<CR>", opts)
  map("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
  map("n", "rn", "<cmd>Lspsaga rename<CR>", opts)
  map("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
  map("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
  map("n", "gh", "<cmd>lua require'lspsaga.provider'.lsp_finder()<cr>", opts)
  map("n", "gd", "<cmd>lua require'lspsaga.provider'.preview_definition()<cr>", opts)
end

-- Comment
if config.enabled.comment then
  map("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<cr>", opts)
  map("v", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", opts)
end

-- ForceWrite
map("n", "<C-s>", "<cmd>w!<CR>", opts)

-- ForceQuit
map("n", "<C-q>", "<cmd>q!<CR>", opts)

-- Terminal
if config.enabled.toggle_term then
  map("n", "<C-\\>", "<cmd>ToggleTerm<CR>", opts)
  map("n", "<leader>tt", "<cmd>lua _HTOP_TOGGLE()<CR>", opts)
  map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", opts)
  map("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", opts)
  map("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", opts)
end

-- SymbolsOutline
if config.enabled.symbols_outline then
  map("n", "<leader>so", "<cmd>SymbolsOutline<CR>", opts)
end

-- nvim-dap
map("n", "<leader>dC", '<cmd>lua require"dap".continue()<CR>', opts)
map("n", "<leader>db", '<cmd>lua require"dap".toggle_breakpoint()<CR>', opts)
map("n", "<leader>dB", ':lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<cr>', opts)
map("n", "<leader>do", '<cmd>lua require"dap".step_over()<CR>', opts)
map("n", "<leader>dO", '<cmd>lua require"dap".step_out()<CR>', opts)
map("n", "<leader>dn", '<cmd>lua require"dap".step_into()<CR>', opts)
map("n", "<leader>dN", '<cmd>lua require"dap".step_back()<CR>', opts)
map("n", "<leader>dr", '<cmd>lua require"dap".repl.toggle()<CR>', opts)
map("n", "<leader>d.", '<cmd>lua require"dap".goto_()<CR>', opts)
map("n", "<leader>dh", '<cmd>lua require"dap".run_to_cursor()<CR>', opts)
map("n", "<leader>de", '<cmd>lua require"dap".set_exception_breakpoints()<CR>', opts)
map("n", "<leader>dv", "<cmd>Telescope dap variables<CR>", opts)
map("n", "<leader>dc", "<cmd>Telescope dap commands<CR>", opts)
map("n", "<leader>dx", '<cmd>lua require"dapui".eval()<CR>', opts)
map("n", "<leader>dX", '<cmd>lua require"dapui".eval(vim.fn.input("expression: "))<CR>', opts)
map("x", "<leader>dx", '<cmd>lua require"dapui".eval()<CR>', opts)

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- disable Ex mode:
map("n", "Q", "<Nop>", opts)

function _G.set_terminal_keymaps()
  vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<A-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<A-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<A-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<A-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd [[
  augroup TermMappings
    autocmd! TermOpen term://* lua set_terminal_keymaps()
  augroup END
]]

return M
