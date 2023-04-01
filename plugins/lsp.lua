return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "astro", "bash", "css", "dockerfile", "dot", "graphql", "html", "javascript", "jsdoc", "json",
        "jsonc", "lua", "markdown", "markdown_inline", "prisma", "python", "regex", "tsx", "typescript", "yaml" }
    }
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "astro", "bashls", "cssls", "cssmodules_ls", "dockerls", "dotls", "emmet_ls", "graphql",
        "html", "jsonls", "lua_ls", "marksman", "prismals", "pyright", "tailwindcss", "tsserver", "yamlls" },
    }
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = { "beautysh", "cspell", "prettierd", "luacheck", "markdownlint", "black", "jsonlint",
        "eslint_d", "mypy", "pydocstyle", "pylint", "shellcheck", "sql_formatter", "yamlfmt", "yamllint" },
      automatic_installation = true,
    }
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = { "python", "node2", "chrome", "bash", },
    }
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, config)
      local null_ls = require("null-ls")

      config.sources = {
        null_ls.builtins.code_actions.cspell,
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.code_actions.shellcheck,

        -- Diagnostics
        null_ls.builtins.diagnostics.cspell,
        null_ls.builtins.diagnostics.dotenv_linter,
        null_ls.builtins.diagnostics.eslint_d,
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
  }
}
