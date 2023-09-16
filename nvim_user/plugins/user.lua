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
  },
  -- {
  --   "nvim-telescope/telescope-media-files.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("telescope").load_extension("media_files")
  --   end,
  -- }
}
