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
		"malbertzard/inline-fold.nvim",
		lazy = false,
		opts = function(_, opts)
			opts.defaultPlaceholder = "…"
			if not opts.queries then
				opts.queries = {
					html = {
						{ pattern = 'class="([^"]*)"' },
						{ pattern = 'className="([^"]*)"' },
						{ pattern = 'href="(.-)"' },
						{ pattern = 'src="(.-)"' },
					},
				}
			end

			for _, language in ipairs(require("utils.constants").filetype.javascript) do
				opts.queries[language] = {
					{ pattern = 'className="([^"]*)"' },
					{ pattern = 'href="(.-)"' },
					{ pattern = 'src="(.-)"' },
				}
			end
			return opts
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
