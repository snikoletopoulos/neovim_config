return {
  { "folke/tokyonight.nvim" },
  { "rakr/vim-one" },
  { "catppuccin/nvim",      as = "catppuccin" },
  {
    "sainnhe/sonokai",
    init = function()
      vim.g.sonokai_style = "andromeda"
    end
  },
}
