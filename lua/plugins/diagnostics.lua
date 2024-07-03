---@type LazySpec
return {
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		---@type trouble.Config
		opts = {
			focus = true,
			open_no_results = true,
			warn_no_results = false,
			---@type trouble.Window.opts
			win = {
				size = {
					width = 80,
					height = 10,
				},
			},
			keys = {
				["<c-s>"] = nil,
				["<c-x>"] = "jump_split",
			},
		},
		keys = {
			{
				"<leader>ud",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Workspace diagnostics",
			},
			{
				"<leader>fd",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer diagnostics",
			},
			{
				"<leader>ur",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
		},
	},
	{ "artemave/workspace-diagnostics.nvim" },
}
