return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    local notify = vim.notify
    vim.notify = function(msg, ...)
        if msg:match("warning: multiple different client offset_encodings") then
            return
        end

        notify(msg, ...)
    end
    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.shfmt,
      null_ls.builtins.formatting.yapf.with({
        command = os.getenv("HOME") .. "/.pyenv/versions/neovim/bin/yapf",
      }),
    }
    return config -- return final config table
  end,
}