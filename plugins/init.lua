return {
    -- Themes
    ["folke/tokyonight.nvim"] = {},
    ["rakr/vim-one"] = {},
    ["sonph/onehalf"] = { rtp = "vim" },
    ["catppuccin/nvim"] = { as = "catppuccin" },
    --

    -- Autocomplete
    ["github/copilot.vim"] = {},
    ["axelvc/template-string.nvim"] = {},
    --

    -- Motion
    ["bkad/CamelCaseMotion"] = {},
    ["wellle/targets.vim"] = {},
    ["tpope/vim-surround"] = {},
    --

    -- Editor behaviour
    ["pocco81/auto-save.nvim"] = { config = function()
        require("auto-save").setup(astronvim.user_plugin_opts(
            "plugins.auto-save", {}))
    end
    },
    ["styled-components/vim-styled-components"] = {},
    ["hail2u/vim-css3-syntax"] = {},
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
    --

    -- UI
    ["folke/trouble.nvim"] = { requires = "nvim-tree/nvim-web-devicons" },
    ["mbbill/undotree"] = {},
}
