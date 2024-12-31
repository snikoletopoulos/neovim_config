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
	{
		"OXY2DEV/markview.nvim",
		opts = function()
			local presets = require("markview.presets")

			return {
				modes = { "n", "i", "no", "c" },
				hybrid_modes = { "i" },
				callbacks = {
					on_enable = function(_, win)
						vim.wo[win].conceallevel = 2
						vim.wo[win].concealcursor = "nc"
					end,
				},
				headings = { shift_width = 2 },
				horizontal_rules = presets.horizontal_rules.thin,
			}
		end,
	},
	{
		"anuvyklack/fold-preview.nvim",
		event = "VeryLazy",
		dependencies = "anuvyklack/keymap-amend.nvim",
		opts = {},
	},
	{
		"anuvyklack/pretty-fold.nvim",
		event = "VeryLazy",
		opts = {},
	},
}
