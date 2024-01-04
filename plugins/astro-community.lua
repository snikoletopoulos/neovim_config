return {
	"AstroNvim/astrocommunity",
	{ import = "astrocommunity.color.tint-nvim" }, -- Dim inactive windows

	{ import = "astrocommunity.completion.copilot-lua" },

	{ import = "astrocommunity.debugging.nvim-bqf" }, -- Quick fix list preview

	{ import = "astrocommunity.editing-support.auto-save-nvim" },
	{ import = "astrocommunity.editing-support.chatgpt-nvim" },
	{ import = "astrocommunity.editing-support.hypersonic-nvim" }, -- RegEx explainer
	{ import = "astrocommunity.editing-support.todo-comments-nvim" },
	{ import = "astrocommunity.editing-support.treesj" }, -- Fold/Unfold code blocks

	{ import = "astrocommunity.git.diffview-nvim" }, -- NOTE: testing

	{ import = "astrocommunity.lsp.nvim-lsp-file-operations" }, -- Fix import when renaming files

	{ import = "astrocommunity.motion.mini-move" },
	{ import = "astrocommunity.motion.nvim-spider" }, -- Replacement for CamelCaseMotion
	{ import = "astrocommunity.motion.nvim-surround" },
	{ import = "astrocommunity.motion.vim-matchup" }, -- Better % motion
	{ import = "astrocommunity.motion.mini-ai" }, -- a/i movements

	{ import = "astrocommunity.register.nvim-neoclip-lua" }, -- Yank manager

	{ import = "astrocommunity.scrolling.neoscroll-nvim" },
	{ import = "astrocommunity.scrolling.nvim-scrollbar" },

	{ import = "astrocommunity.search.sad-nvim" },

	{ import = "astrocommunity.utility.nvim-toggler" }, -- Toggle words
	{ import = "astrocommunity.utility.noice-nvim" },

	-- Learning good vim
	{ import = "astrocommunity.workflow.hardtime-nvim" },
}
