local home = os.getenv("HOME")
local pyenv_python = home .. "/.pyenv/shims/python"

return {
  settings = {
    pylsp = {
      plugins = {
        jedi = {
          -- pylsp.plugins.jedi.environment
          environment = pyenv_python,
        },
        flake8 = {
          maxLineLength = 128,
          ignore = {'E111', 'E501'}
        }
      }
    }
  }
}
