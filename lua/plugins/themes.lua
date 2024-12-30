return {
	{
		"folke/tokyonight.nvim",
		---@type tokyonight.Config
		opts = {
			styles = {
				types = { bold = true },
				variables = { bold = true },
			},
		},
	},
	{ "rakr/vim-one" },
	{
		"sainnhe/sonokai",
		init = function()
			vim.g.sonokai_style = "andromeda"
			vim.g.sonokai_enable_italic = 1
			vim.g.sonokai_dim_inactive_windows = 1
			vim.g.sonokai_spell_foreground = "colored"
			vim.g.sonokai_float_style = "dim"
			vim.g.sonokai_diagnostic_virtual_text = "colored"
			vim.g.sonokai_inlay_hints_background = "dimmed"
		end,
	},
	{ "AstroNvim/astrotheme" },
	{
		"Shatur/neovim-ayu",
		opts = { mirage = false },
		config = function(_, opts) require("ayu").setup(opts) end,
	},
	{ "samharju/synthweave.nvim" },
	{
		"navarasu/onedark.nvim",
		opts = {
			style = "darker",
			code_style = {
				variables = "bold",
				functions = "bold",
				comments = "italic",
				keywords = "italic",
			},
		},
	},
	{
		"olimorris/onedarkpro.nvim",
		enabled = require("colorscheme") == "onedark_vivid",
		opts = {
			styles = {
				types = "bold",
				methods = "bold",
				comments = "italic",
				keywords = "italic",
			},
			options = {
				cursorline = true,
				transparency = true,
			},
		},
	},
}
