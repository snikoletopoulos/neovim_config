---@type LazySpec
return {
	{
		"FabijanZulj/blame.nvim",
		opts = { date_format = "%d/%m/%Y" },
	},
	{
		"mbbill/undotree",
		keys = {
			{
				"<leader>uu",
				"<CMD>UndotreeToggle<CR><CMD>UndotreeFocus<CR>",
				desc = "Toggle undotree",
			},
		},
		init = function() vim.g.undotree_WindowLayout = 2 end,
	},
	{
		"sindrets/diffview.nvim",
		opts = { view = { merge_tool = { layout = "diff4_mixed" } } },
	},
	{
		"kevinhwang91/nvim-bqf",
		dependencies = { "folke/snacks.nvim" },
		opts = function(_, opts)
			if not opts.preview then opts.preview = {} end
			if Snacks.util.is_transparent() then opts.preview.winblend = 0 end
			return opts
		end,
	},
	{
		"folke/noice.nvim",
		dependencies = { "folke/snacks.nvim" },
		opts = function(_, opts)
			return require("astrocore").extend_tbl(opts, {
				lsp = {
					signature = { enabled = true },
					hover = { enabled = false },
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				views = {
					cmdline_popup = {
						border = Snacks.util.is_transparent() and {} or {
							style = "none",
							padding = { 1, 2 },
						},
					},
				},
			}
		end,
	},
	{
		"OlegGulevskyy/better-ts-errors.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = { keymaps = { toggle = "gL" } },
	},
}
