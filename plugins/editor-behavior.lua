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
		"Pocco81/auto-save.nvim",
		keys = { { "<leader>fa", ":ASToggle<CR>", desc = "Toggle auto-save" } },
		opts = {
			debounce_delay = 1000,
			execution_message = {
				message = function()
					return ""
				end,
			},
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
		dependencies = { { "nvim-lua/plenary.nvim" } },
		event = "VeryLazy",
		build = ":Neorg sync-parsers",
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
	{ "karb94/neoscroll.nvim", enabled = not vim.g.neovide },
}
