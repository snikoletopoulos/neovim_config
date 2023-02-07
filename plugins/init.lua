return {
    ["github/copilot.vim"] = {},
    ["bkad/CamelCaseMotion"] = {},
    ["pocco81/auto-save.nvim"] = {
        config = function()
            require("auto-save").setup({
                debounce_delay = 1000,
            })
        end
    },
    ["folke/trouble.nvim"] = { requires = "nvim-tree/nvim-web-devicons" },
    ["styled-components/vim-styled-components"] = {},
    ["hail2u/vim-css3-syntax"] = {},
    ["mbbill/undotree"] = {},
    ["wellle/targets.vim"] = {},
    ["tpope/vim-surround"] = {},
    ["folke/tokyonight.nvim"] = {}
}
