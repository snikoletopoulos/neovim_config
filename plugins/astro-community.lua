return {
	"AstroNvim/astrocommunity",
	{ import = "astrocommunity.debugging.nvim-bqf" }, -- Quick fix list preview

	{ import = "astrocommunity.editing-support.hypersonic-nvim" }, -- RegEx explainer
	{ import = "astrocommunity.editing-support.todo-comments-nvim" },
	{ import = "astrocommunity.editing-support.treesj" }, -- Fold/Unfold code blocks
	{ import = "astrocommunity.editing-support.vim-move" },

	{ import = "astrocommunity.git.diffview-nvim" }, -- NOTE: testing

	{ import = "astrocommunity.motion.nvim-surround" },
	{ import = "astrocommunity.motion.vim-matchup" }, -- Better % motion

	{ import = "astrocommunity.project.projectmgr-nvim" },
	{
		"charludo/projectmgr.nvim",
		keys = {
			{ "<leader>fp", "<cmd>ProjectMgr<cr>", desc = "Open ProjectMgr panel" },
		},
	},

	{ import = "astrocommunity.register.nvim-neoclip-lua" }, -- Yank manager
	{ import = "astrocommunity.scrolling.neoscroll-nvim" },
	{ import = "astrocommunity.scrolling.nvim-scrollbar" },
	{ import = "astrocommunity.search.sad-nvim" },

	{ import = "astrocommunity.utility.nvim-toggler" }, -- Toggle words
	{ import = "astrocommunity.utility.noice-nvim" },

	-- Testing
	{ import = "astrocommunity.lsp.garbage-day-nvim" },
	{
		"zeioth/garbage-day.nvim",
		opts = { { notifications = true } },
	},
}
