---@type LazySpec
return {
	{
		"petertriho/nvim-scrollbar",
		opts = {
			excluded_filetypes = {
				-- "cmp_docs",
				"cmp_menu",
				-- 	"noice",
				"prompt",
				"TelescopePrompt",
				"neo-tree",
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {
			mode = "topline",
			separator = "",
			max_lines = 8,
			trim_scope = "outer",
		},
	},
}
