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
		init = function() vim.g.undotree_WindowLayout = 2 end,
	},
	},
	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"FabijanZulj/blame.nvim",
		opts = { date_format = "%d/%m/%Y" },
	},
}
