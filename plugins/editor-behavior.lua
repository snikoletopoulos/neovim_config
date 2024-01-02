return {
	-- TODO: testing
	-- {
	-- 	"karb94/neoscroll.nvim",
	-- 	opts = {
	-- 		post_hook = function()
	-- 			vim.fn.feedkeys("M")
	-- 		end,
	-- 	},
	-- },
	-- NOTE: Vim plugin
	{ "mg979/vim-visual-multi", lazy = false },
	{
		"pocco81/auto-save.nvim",
		event = "VeryLazy",
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
	-- NOTE: Vim plugin
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
}
