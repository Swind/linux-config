return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "ntpeters/vim-better-whitespace",
     event = "VeryLazy",
  },
  {
    "github/copilot.vim",
    event = "VeryLazy",
    config = function()
      require 'hex'.setup {

        -- cli command used to dump hex data
        dump_cmd = 'xxd -g 1 -u',

        -- cli command used to assemble from hex data
        assemble_cmd = 'xxd -r',

        -- function that runs on BufReadPre to determine if it's binary or not
        is_buf_binary_pre_read = function()
          -- logic that determines if a buffer contains binary data or not
          -- must return a bool
        end,

        -- function that runs on BufReadPost to determine if it's binary or not
        is_buf_binary_post_read = function()
          -- logic that determines if a buffer contains binary data or not
          -- must return a bool
        end,
      }
    end,
  },
  {
    'RaafatTurki/hex.nvim',
  }
  -- {
  --   "nvim-telescope/telescope-media-files.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("telescope").load_extension("media_files")
  --   end,
  -- }
}
