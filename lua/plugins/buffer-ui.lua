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
	-- {
	-- 	"OXY2DEV/markview.nvim",
	-- 	opts = function()
	-- 		local presets = require("markview.presets")
	--
	-- 		return {
	-- 			modes = { "n", "i", "no", "c" },
	-- 			hybrid_modes = { "i" },
	-- 			callbacks = {
	-- 				on_enable = function(_, win)
	-- 					vim.wo[win].conceallevel = 2
	-- 					vim.wo[win].concealcursor = "nc"
	-- 				end,
	-- 			},
	-- 			headings = { shift_width = 2 },
	-- 			horizontal_rules = presets.horizontal_rules.thin,
	-- 		}
	-- 	end,
	-- },
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {
			heading = {
				render_modes = true,
				border = true,
				border_virtual = true,
			},
			paragraph = { render_modes = true },
			code = {
				render_modes = true,
				width = "block",
				left_pad = 2,
				right_pad = 2,
			},
			dash = { render_modes = true },
			bullet = { render_modes = true },
			checkbox = {
				render_modes = true,
				scope_highlight = "@markup.strikethrough",
			},
			quote = { render_modes = true },
			pipe_table = { render_modes = true },
			link = { render_modes = true },
			indent = {
				enabled = true,
				render_modes = true,
				per_level = 2,
				skip_heading = true,
			},
		},
	},
	{
		"kevinhwang91/nvim-ufo",
		event = "BufReadPost",
		dependencies = { "kevinhwang91/promise-async" },
		opts = {},
	},
	{
		"malbertzard/inline-fold.nvim",
		cmd = { "InlineFoldToggle" },
		opts = function(_, opts)
			opts.defaultPlaceholder = "…"

			if not opts.queries then opts.queries = {} end

			opts.queries.html = require("astrocore").extend_tbl(opts.queries.html, {
				{ pattern = 'class="([^"]*)"' },
				{ pattern = 'href="(.-)"' },
				{ pattern = 'src="(.-)"' },
			})

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
}
