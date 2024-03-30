return {
	{
		"smoka7/multicursors.nvim",
		keys = {
			{ "<leader>m", enabled = false },
			{
				"<M-n>",
				"<cmd>MCstart<cr>",
				desc = "Create a selection for selected text or word under the cursor",
				mode = { "v", "n" },
			},
		},
	},
	{
		"okuuva/auto-save.nvim",
		cmd = { "ASToggle" },
		event = { "User AstroFile", "InsertLeave", "TextChanged" },
		keys = {
			{
				"<leader>fa",
				function()
					vim.cmd("ASToggle")
				end,
				desc = "Toggle auto-save",
			},
		},
		opts = {
			execution_message = { enabled = false },
			condition = function(buffer)
				return require("auto-save.utils.data").not_in(
					vim.fn.getbufvar(buffer, "&filetype"),
					{ "harpoon" }
				)
			end,
		},
	},
	{
		"Wansmer/treesj",
		keys = {
			{
				"<leader>m",
				function()
					require("treesj").toggle()
				end,
				desc = "Split/join block",
			},
			{
				"<leader>M",
				function()
					require("treesj").toggle({ split = { recursive = true } })
				end,
				desc = "Split/join block recursively",
			},
		},
	},
	{
		"nvim-neorg/neorg",
		dependencies = { "nvim-lua/plenary.nvim" },
		build = ":Neorg sync-parsers",
		ft = "norg",
		opts = {
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {
					config = { icon_preset = "diamond" },
				},
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/notes",
							current_dir = ".",
						},
						default_workspace = "notes",
					},
				},
				["core.completion"] = {
					config = {
						engine = "nvim-cmp",
					},
				},
				["core.integrations.nvim-cmp"] = {},
			},
		},
	},
	{
		"marilari88/twoslash-queries.nvim",
		ft = astronvim.user_opts("utils.constants").filetype.javascript,
	},
	{ "karb94/neoscroll.nvim", cond = not vim.g.neovide },
}
