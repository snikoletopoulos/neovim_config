return {
  -- Themes
  ["folke/tokyonight.nvim"] = {},
  ["rakr/vim-one"] = {},
  ["sonph/onehalf"] = { rtp = "vim" },
  ["catppuccin/nvim"] = { as = "catppuccin" },
  ["nyoom-engineering/nyoom.nvim"] = {},
  ["sainnhe/sonokai"] = {},
  --

  -- Autocomplete
  ["github/copilot.vim"] = {},
  ["axelvc/template-string.nvim"] = {},
  ["marilari88/twoslash-queries.nvim"] = {},
  --

  -- Motion
  ["bkad/CamelCaseMotion"] = {},
  ["wellle/targets.vim"] = {},
  ["tpope/vim-surround"] = {},
  --

  -- Syntax support
  ["styled-components/vim-styled-components"] = {},
  ["hail2u/vim-css3-syntax"] = {},
  --

  -- Editor behavior
  ["pocco81/auto-save.nvim"] = { config = function()
    require("auto-save").setup(astronvim.user_plugin_opts(
      "plugins.auto-save", {}))
  end
  },
  ["folke/todo-comments.nvim"] = {
    requires = "nvim-lua/plenary.nvim",
    config = function() require("todo-comments").setup(astronvim.user_plugin_opts("plugins.todo-comments", {})) end
  },
  ["anuvyklack/fold-preview.nvim"] = {
    requires = 'anuvyklack/keymap-amend.nvim',
    config = function()
      require('fold-preview').setup(astronvim.user_plugin_opts("plugins.fold-preview", {}))
    end
  },
  ["anuvyklack/pretty-fold.nvim"] = { config = function()
    require('pretty-fold').setup()
  end
  },
  ["karb94/neoscroll.nvim"] = {
    config = function()
      require("neoscroll").setup(astronvim.user_plugin_opts("plugins.neoscroll", {}))
    end
  },
  ["mg979/vim-visual-multi"] = {},
  -- ["ThePrimeagen/refactoring.nvim"] = {
  --   requires = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
  --   config = function()
  --     require("refactoring").setup(astronvim.user_plugin_opts("plugins.refactoring", {}))
  --     require("telescope").load_extension("refactoring")
  --   end
  -- },
  --

  -- UI
  ["folke/trouble.nvim"] = { requires = "nvim-tree/nvim-web-devicons" },
  ["mbbill/undotree"] = {},
  -- ["dhruvasagar/vim-dotoo"] = {},
  ["j-hui/fidget.nvim"] = {
    config = function()
      require "fidget".setup(astronvim.user_plugin_opts("plugins.fidget", {}))
    end
  },
  -- ["folke/noice.nvim"] = {
  --   config = function()
  --     require("noice").setup(astronvim.user_plugin_opts("plugins.noice", {}))
  --   end
  -- },
}
