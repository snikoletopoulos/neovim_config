return {
  { "folke/tokyonight.nvim", lazy = false },
  { "rakr/vim-one" },
  { "catppuccin/nvim",       as = "catppuccin" },
  {
    "sainnhe/sonokai",
    lazy = false,
    init = function()
      vim.g.sonokai_style = "andromeda"
    end
  },
}
