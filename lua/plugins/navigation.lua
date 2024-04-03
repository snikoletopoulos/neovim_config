---@type LazySpec
return {
	{
		"SmiteshP/nvim-navbuddy",
		dependencies = {
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim",
			"neovim/nvim-lspconfig",
		},
		keys = {
			{
				"<leader>fs",
				function() require("nvim-navbuddy").open() end,
				desc = "Breadcrumb search",
			},
		},
		opts = { lsp = { auto_attach = true } },
	},
	{
		"charludo/projectmgr.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>fp", "<cmd>ProjectMgr<cr>", desc = "Change project" },
		},
	},
}
