local M = {}

function M.config()
  local dap = require "dap"

  local dap_python = require "dap-python"

  dap_python.setup("~/.pyenv/versions/3.9.7/envs/neovim/bin/python3.9", { include_configs = false })
  dap.configurations.python = {
    {
      type = "python",
      request = "launch",
      name = "Launch file",
      justMyCode = false,
      program = "${file}",
      console = "internalConsole",
      pythonPath = require("core.utils").get_python_path(),
    },
    {
      type = "python",
      request = "attach",
      name = "Attach remote",
      justMyCode = false,
      pythonPath = require("core.utils").get_python_path(),
      host = function()
        local value = vim.fn.input "Host [127.0.0.1]: "
        if value ~= "" then
          return value
        end
        return "127.0.0.1"
      end,
      port = function()
        return tonumber(vim.fn.input "Port [5678]: ") or 5678
      end,
    },
  }

  dap_python.test_runner = "pytest"

  dap.configurations.lua = {
    {
      type = "nlua",
      request = "attach",
      name = "Attach to running Neovim instance",
      host = function()
        local value = vim.fn.input "Host [127.0.0.1]: "
        if value ~= "" then
          return value
        end
        return "127.0.0.1"
      end,
      port = function()
        local val = tonumber(vim.fn.input "Port: ")
        assert(val, "Please provide a port number")
        return val
      end,
    },
  }

  dap.adapters.nlua = function(callback, config)
    callback { type = "server", host = config.host, port = config.port }
  end

  dap.adapters.lldb = {
    type = "executable",
    attach = { pidProperty = "pid", pidSelect = "ask" },
    command = "lldb-vscode-12",
    env = { LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES" },
  }

  dap.configurations.rust = {
    {
      type = "rust",
      request = "launch",
      name = "lldb",
      program = function()
        local metadata_json = vim.fn.system "cargo metadata --format-version 1 --no-deps"
        local metadata = vim.fn.json_decode(metadata_json)
        local target_name = metadata.packages[1].targets[1].name
        local target_dir = metadata.target_directory
        return target_dir .. "/debug/" .. target_name
      end,
    },
  }

  dap.configurations.cpp = {
    {
      -- If you get an "Operation not permitted" error using this, try disabling YAMA:
      --  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
      name = "Attach to process",
      type = "lldb", -- Adjust this to match your adapter name (`dap.adapters.<name>`)
      request = "attach",
      pid = require("dap.utils").pick_process,
      args = {},
    },
  }

  local dapui = require "dapui"
  dapui.setup {}

  vim.fn.sign_define("DapBreakpoint", { text = "→", texthl = "Error", linehl = "", numhl = "" })
  vim.fn.sign_define("DapStopped", { text = "→", texthl = "Success", linehl = "", numhl = "" })

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
    dap.repl.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
    dap.repl.close()
  end
end

return M
