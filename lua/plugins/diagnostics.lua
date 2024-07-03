---@type LazySpec
return {
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
	{ "artemave/workspace-diagnostics.nvim" },
}
