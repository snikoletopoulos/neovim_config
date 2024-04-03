---@type LazySpec
return {
	{
		"akinsho/toggleterm.nvim",
		opts = {
			float_opts = {
				width = 1000,
				height = 1000,
			},
			winbar = { enabled = false },
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
		"folke/trouble.nvim",
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
}
