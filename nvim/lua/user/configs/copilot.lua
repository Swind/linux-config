local M = {}

function M.config() end
vim.g.copilot_no_tab_map = true
vim.g.copilot_filetypes = {
  cpp = false,
  h = false,
  cc = false,
}
return M
