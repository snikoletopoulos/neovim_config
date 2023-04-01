return {
  "styled-components/vim-styled-components",
  "hail2u/vim-css3-syntax",
  {
    "NvChad/nvim-colorizer.lua",
    lazy = false,
    opts = {
      user_default_options = {
        tailwind = true,
        names = true,
        RRGGBBAA = true,
        mode = "background",
      }
    }
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({
        highlight = {
          pattern = [[.*<(KEYWORDS)\s*]]
        },
        search = {
          pattern = [[\b(KEYWORDS)\b]]
        }
      })
    end
  },
}
