return function(config)
  local null_ls = require("null-ls")

  config.sources = {
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettierd,
      -- null_ls.builtins.formatting.eslint_d,
  }
  return config
end
