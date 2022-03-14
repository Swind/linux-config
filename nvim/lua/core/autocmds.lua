local M = {}

local utils = require "core.utils"
local config = utils.user_settings()
local colorscheme = config.colorscheme

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

vim.cmd [[
  augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline
    autocmd WinEnter * set cursorline
  augroup end
]]

vim.cmd(string.format(
  [[
    augroup colorscheme
      autocmd!
      autocmd VimEnter * colorscheme %s
    augroup end]],
  colorscheme
))

vim.cmd [[
  command! AstroUpdate lua require('core.utils').update()
]]

return M
