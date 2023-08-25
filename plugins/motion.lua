return {
  {
    "bkad/CamelCaseMotion",
    lazy = false, -- TODO: remove this when keymaps are fixed
    keys = {
      { "<leader>w",  "<Plug>CamelCaseMotion_w",  desc = "Next camel case word",            mode = { "n", "v" } },
      { "<leader>e",  "<Plug>CamelCaseMotion_e",  desc = "Next end of camel case word",     mode = { "n", "v" } },
      { "<leader>b",  "<Plug>CamelCaseMotion_b",  desc = "Next start of camel case word",   mode = { "n", "v" } },
      { "<leader>ge", "<Plug>CamelCaseMotion_ge", desc = "Previous end of camel case word", mode = { "n", "v" } },
    }
  },
  { "wellle/targets.vim", lazy = false },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },
  {
    "fedepujol/move.nvim",
    -- TODO: fix visual mode mappings
    keys = {
      { "<M-j>", "<cmd>MoveLine(1)<CR>",    desc = "Move line bellow" },
      { "<M-k>", "<cmd>MoveLine(-1)<CR>",   desc = "Move line above" },
      { "<M-h>", "<cmd>MoveHChar(-1)<CR>",  desc = "Move character left" },
      { "<M-l>", "<cmd>MoveHChar(1)<CR>",   desc = "Move character right" },
      { "<M-k>", "<cmd>MoveBlock(-1)<CR>",  desc = "Move block up",       mode = "v" },
      { "<M-j>", "<cmd>MoveBlock(1)<CR>",   desc = "Move block down",     mode = "v" },
      { "<M-h>", "<cmd>MoveHBlock(-1)<CR>", desc = "Move block right",    mode = "v" },
      { "<M-l>", "<cmd>MoveHBlock(1)<CR>",  desc = "Move block left",     mode = "v" },
    },
  }
}
