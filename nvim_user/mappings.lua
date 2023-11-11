-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab2" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- navigate
    ["<A-h>"] = { "<C-w>h", desc = "Move to left split" },
    ["<A-j>"] = { "<C-w>j", desc = "Move to down split" },
    ["<A-k>"] = { "<C-w>k", desc = "Move to up split" },
    ["<A-l>"] = { "<C-w>l", desc = "Move to right split" },
    ["<F4>"] = { "<cmd>ClangdSwitchSourceHeader<CR>", desc = "Switch between header and source" },
    -- search all files
    ["<C-p>"] = {
      function()
        require("telescope.builtin").find_files(require('telescope.themes').get_ivy({
          hidden = true,
          no_ignore = false,
          previewer = false,
          file_ignore_patterns = {
            ".git/",
            -- ".cache",
            "%.o",
            "%.a",
            "%.out",
            "%.class",
            "%.pdf",
            "%.mkv",
            "%.mp4",
            "%.zip",
            "%.pyc",
            ".node_modules/",
            ".vscode/",
          },
          find_command = { 'rg', '--files' },
        }))
      end,
      desc = "Search all files ( with hidden files )",
    },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {
    -- Accept copilot suggestion
    ["<C-l>"] = {
      "copilot#Accept(<Tab>)",
      silent = true,
      expr = true,
      script = true,
      replace_keycodes = false,
    },
  }
}
