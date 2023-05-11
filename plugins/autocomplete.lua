return {
  { "github/copilot.vim",               lazy = false },
  {
    "axelvc/template-string.nvim",
    lazy = false,
    config = function()
      require("template-string").setup({
        jsx_brackets = true,
        remove_template_strings = true,
        restore_quotes = {
          normal = [["]],
          jsx = [["]],
        },
      })
    end
  },
  { "marilari88/twoslash-queries.nvim", lazy = false },
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require("plugins.configs.luasnip")(plugin, opts)
      require("luasnip.loaders.from_vscode").lazy_load { paths = { "./lua/user/snippets" } }
    end,
  },
}
