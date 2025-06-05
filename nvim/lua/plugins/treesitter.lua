-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      -- css, html, javascript, latex, norg, scss, svelte, tsx, typst, vue
      "css",
      "html",
      "javascript",
      "latex",
      "norg",
      "scss",
      "svelte",
      "tsx",
      "typst",
      "vue",
    },
  },
}
