return {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391'},
          maxLineLength = 100,
          -- enabled = false -- default true
        },
        pylint = {
          enabled = true, -- default false
        }
      },
      configurationSources = {
        "flake8"
        -- "pycodestyle",
      },
    }
  }
}
