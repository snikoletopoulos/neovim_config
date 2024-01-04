return {
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		cmd = { "TroubleToggle", "Trouble" },
		opts = {
			use_diagnostic_signs = true,
			action_keys = {
				close = { "q", "<esc>" },
				cancel = "<c-e>",
			},
		},
		keys = {
			{
				"<leader>ud",
				"<cmd>TroubleToggle workspace_diagnostics<CR>",
				desc = "Toggle trouble",
			},
			{
				"<leader>fd",
				"<cmd>TroubleToggle document_diagnostics<CR>",
				desc = "Toggle trouble for document",
			},
		},
	},
	{
		"mbbill/undotree",
		keys = {
			{
				"<leader>uu",
				"<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>",
				desc = "Toggle undotree",
			},
		},
	},
	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		opts = {},
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
	{
		"LinArcX/telescope-command-palette.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		keys = {
			{
				"<leader>P",
				"<cmd>Telescope command_palette<CR>",
				desc = "Command palette",
			},
		},
		config = function()
			require("telescope").load_extension("command_palette")
		end,
	},
	{
		"folke/noice.nvim",
		opts = {
			routes = {
				{
					filter = {
						event = "notify",
						find = "No information available",
					},
					opts = { skip = true },
				},
			},
			lsp = { progress = { enabled = false } },
			views = {
				cmdline_popup = {
					border = {
						style = "none",
						padding = { 1, 2 },
					},
					filter_options = {},
					win_options = {
						winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
					},
				},
			},
			presets = { bottom_search = false },
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		opts = {
			extensions = {
				command_palette = astronvim.user_opts("command_palette", {}),
			},
		},
	},
	{ "kevinhwang91/nvim-bqf", ft = "qf" },
	{
		"nvim-treesitter/nvim-treesitter-context",
		lazy = false,
		opts = {
			mode = "topline",
			separator = "",
			max_lines = 8,
			trim_scope = "outer",
		},
		{
			"jackMort/ChatGPT.nvim",
			opts = { api_key_cmd = "echo $CHAT_GPT_API_KEY" },
		},
	},
	{
		"vuki656/package-info.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {},
		event = "BufRead package.json",
	},
	{
		"akinsho/toggleterm.nvim",
		opts = {
			float_opts = {
				width = 1000,
				height = 1000,
			},
		},
	},
}
