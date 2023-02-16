return function(config)
  local null_ls = require("null-ls")

  config.sources = {
    null_ls.builtins.code_actions.cspell,
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.code_actions.shellcheck,

    -- Diagnostics
    null_ls.builtins.diagnostics.cspell,
    null_ls.builtins.diagnostics.dotenv_linter,
    -- null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.diagnostics.jsonlint,
    null_ls.builtins.diagnostics.luacheck,
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.pydocstyle,
    null_ls.builtins.diagnostics.pylint,
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.diagnostics.yamllint,
    null_ls.builtins.diagnostics.zsh,

    -- Formatting
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.json_tool,
    null_ls.builtins.formatting.markdownlint,
    null_ls.builtins.formatting.nginx_beautifier,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.prismaFmt,
    null_ls.builtins.formatting.yamlfmt,
  }
  return config
end
