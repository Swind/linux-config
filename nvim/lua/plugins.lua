return require('packer').startup(function()
  -- Packer can manage itself
  use {'wbthomason/packer.nvim', opt = true}

  -- Color scheme
  use { 'marko-cerovac/material.nvim' }

  -- Syntax highlight
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'romgrk/nvim-treesitter-context' }

  -- File explorer
  use { 
    'kyazdani42/nvim-tree.lua', 
    requires = {
      'kyazdani42/nvim-web-devicons' -- optional, for file icon
    }
  }
  

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'}, 
      {'nvim-lua/plenary.nvim'}
    }
  }

  -- LSP and completion
  use { 
    'neovim/nvim-lspconfig', 
    'williamboman/nvim-lsp-installer',

    -- nvim-cmp
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',

    -- for vsnip users
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
  }

  -- lspfuzzy
  -- this plugin makes the Neovim LSP client use FZF to display results and
  -- navigate the code.
  use {
    'ojroques/nvim-lspfuzzy',
    requires = {
      {'junegunn/fzf'},
      {'junegunn/fzf.vim'},  -- to enable preview (optional)
    },
  }

  -- lspsaga
  -- A light-weight lsp plugin based on neovim built-in lsp with highly a performant UI.
  use {
    'glepnir/lspsaga.nvim'
  }

end)
