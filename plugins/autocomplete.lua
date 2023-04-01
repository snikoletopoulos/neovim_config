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
}
