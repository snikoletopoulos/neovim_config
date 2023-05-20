return {
  { "styled-components/vim-styled-components", lazy = false },
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
    keys = {
      { "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Find todos" },
    },
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
