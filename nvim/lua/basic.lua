------------------------------------------------------------------------
-- General Neovim settings and configuration
------------------------------------------------------------------------
------------------------------------------------------------------------
-- Neovim API alias
------------------------------------------------------------------------
local g = vim.g                      -- Global variables
local opt = vim.opt                  -- Set options ( global/buffer/windows-scoped )
 
------------------------------------------------------------------------
-- General
------------------------------------------------------------------------
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'        -- Copy/Paste to system clipboard
opt.swapfile = false                 -- Don't use swapfile
opt.completeopt = 'menuone,noselect' -- Autocomplete options
g.encoding = "UTF-8"                 -- UTF-8
opt.fileencoding = 'utf-8'

-- auto read when file is changed from outside
opt.autoread = true

------------------------------------------------------------------------
-- Memory, CPU
------------------------------------------------------------------------
opt.hidden = true     -- Enable background buffers
opt.history = 100     -- Remerber N lines in history
opt.lazyredraw = true -- Faster scrolling
opt.synmaxcol = 240   -- Max column for syntax highlight

------------------------------------------------------------------------
-- Neovim UI
------------------------------------------------------------------------
opt.number = true                     -- Show line number
opt.showmatch = true                  -- Highlight matching parenthesis
opt.foldmethod = 'marker'             -- Enable folding (default 'foldmarker')
opt.colorcolumn = '80'                -- Line lenght marker at 80 columns
opt.splitright = true                 -- Vertical split to the right
opt.splitbelow = true                 -- Orizontal split to the bottom
opt.ignorecase = true                 -- Ignore case letters when search
opt.smartcase = true                  -- Ignore lowercase for the whole pattern
opt.linebreak = true                  -- Wrap on word boundary
opt.hlsearch = true                   -- highlight all its matches.

-- always at least eight lines visible above/below the cursor 
opt.scrolloff = 4
opt.sidescrolloff = 4

-- while typing a search command, show where the pattern, 
-- as it was typed so far, matches.
opt.incsearch = true

-- show current mode
opt.showmode = false

-- Number of screen lines to use for the command-line.
opt.cmdheight = 2

------------------------------------------------------------------------
-- Tabs, indent
------------------------------------------------------------------------
opt.tabstop = 2 -- Shift 2 spaces when tab
opt.expandtab = true -- Use spaces instead of tabs
opt.softtabstop = 2
opt.shiftround = true -- use multiple of shiftwidth when indenting with '<' and '>'
opt.shiftwidth = 2 -- number of spaces to use for autoindenting
opt.autoindent = true
opt.smartindent = true

-- no wrap
opt.wrap = false

-- Allow specified keys that move the cursor left/right to move to the
-- previous/next line when the cursor is on the first/last character in
-- the line.
opt.whichwrap = 'b,s,<,>,[,],h,l'

-- no *~ backup files and swap file.
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- smaller updatetime
opt.updatetime = 300

-- Time in milliseconds to wait for a mapped sequence to complete.
-- vim.o.timeoutlen = 300

-- When on, splitting a window will put the new window right/below the current
-- one.
vim.o.splitbelow = true
vim.o.splitright = true

-- comma separated list of options for Insert mode completion
-- |ins-completion|.
g.completeopt = "menu,menuone,noselect,noinsert"

-- show space char as '.'
opt.list = true
opt.listchars = "space:·"

-- wild char completion menu
opt.wildmenu = true

-- Dont' pass messages to |ins-completin menu|
opt.shortmess = vim.o.shortmess .. 'c'
opt.pumheight = 10

-- always show tabline
opt.showtabline = 2

-- allow backspacing over everything in insert mode
opt.bs = "indent,eol,start"

