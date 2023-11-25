return {
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		keys = {
			{
				"<leader>ut",
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
		-- NOTE: plugin is being rewritten
		tag = "legacy",
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
		opts = function(_, opts)
			if not opts.routes then
				opts.routes = {}
			end

			table.insert(opts.routes, {
				filter = {
					event = "notify",
					find = "No information available",
				},
				opts = { skip = true },
			})

			opts.lsp.progress = { enabled = false }

			opts.views = vim.tbl_deep_extend("force", opts.views or {}, {
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
			})

			opts.presets.bottom_search = false
			return opts
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		config = function(plugin, opts)
			if not opts.extensions then
				opts.extensions = {}
			end
			opts.extensions.command_palette =
				astronvim.user_opts("command_palette", {})
			require("plugins.configs.telescope")(plugin, opts)
		end,
	},
	{ "kevinhwang91/nvim-bqf", ft = "qf" },
}
