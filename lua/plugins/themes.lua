return {
	{ "folke/tokyonight.nvim" },
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
			vim.g.sonokai_better_performance = 1
		end,
	},
	{
		"sainnhe/edge",
		init = function()
			vim.g.edge_style = "aura"
			vim.g.edge_dim_inactive_windows = 1
			vim.g.edge_diagnostic_virtual_text = "colored"
			vim.g.edge_diagnostic_line_highlight = "colored"
		end,
	},
	{ "projekt0n/github-nvim-theme" },
	{ "AstroNvim/astrotheme" },
	{ "Mofiqul/vscode.nvim" },
}
