return {
	"AstroNvim/astrocommunity",
	{ import = "astrocommunity.debugging.nvim-bqf" },

	{ import = "astrocommunity.editing-support.hypersonic-nvim" },
	{ import = "astrocommunity.editing-support.treesj" },
	{ import = "astrocommunity.editing-support.vim-move" },

	{ import = "astrocommunity.git.diffview-nvim" },

	{ import = "astrocommunity.motion.nvim-surround" },
	{ import = "astrocommunity.motion.vim-matchup" },

	{ import = "astrocommunity.project.projectmgr-nvim" },
	{
		"charludo/projectmgr.nvim",
		keys = {
			{ "<leader>fp", "<cmd>ProjectMgr<cr>", desc = "Open ProjectMgr panel" },
		},
	},

	{ import = "astrocommunity.register.nvim-neoclip-lua" },
	{ import = "astrocommunity.scrolling.neoscroll-nvim" },
	{ import = "astrocommunity.search.sad-nvim" },

	{ import = "astrocommunity.utility.nvim-toggler" },
	{ import = "astrocommunity.utility.noice-nvim" },

	-- Testing
	{ import = "astrocommunity.lsp.garbage-day-nvim" },
	{
		"zeioth/garbage-day.nvim",
		opts = { { notifications = true } },
	},
}
