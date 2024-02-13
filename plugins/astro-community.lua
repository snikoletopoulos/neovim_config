return {
	"AstroNvim/astrocommunity",
	{ import = "astrocommunity.color.tint-nvim" }, -- Dim inactive windows

	{ import = "astrocommunity.completion.copilot-lua" },

	{ import = "astrocommunity.diagnostics.trouble-nvim" },

	{ import = "astrocommunity.debugging.nvim-bqf" }, -- Quick fix list preview

	{ import = "astrocommunity.editing-support.auto-save-nvim" },
	{ import = "astrocommunity.editing-support.chatgpt-nvim" },
	{ import = "astrocommunity.editing-support.hypersonic-nvim" }, -- RegEx explainer
	-- { import = "astrocommunity.editing-support.multicursors-nvim" },
	{ import = "astrocommunity.editing-support.nvim-devdocs" },
	{ import = "astrocommunity.editing-support.todo-comments-nvim" },
	{ import = "astrocommunity.editing-support.treesj" }, -- Fold/Unfold code blocks

	{ import = "astrocommunity.git.diffview-nvim" }, -- NOTE: testing

	{ import = "astrocommunity.lsp.nvim-lsp-file-operations" }, -- Fix import when renaming/moving files

	{ import = "astrocommunity.motion.mini-move" },
	{ import = "astrocommunity.motion.nvim-spider" }, -- Replacement for CamelCaseMotion
	{ import = "astrocommunity.motion.nvim-surround" },
	-- NOTE: Vim plugin
	{ import = "astrocommunity.motion.vim-matchup" }, -- Better % motion
	{ import = "astrocommunity.motion.mini-ai" }, -- a/i movements

	{ import = "astrocommunity.pack.astro" },
	{ import = "astrocommunity.pack.bash" },
	{ import = "astrocommunity.pack.cpp" },
	{ import = "astrocommunity.pack.docker" },
	{ import = "astrocommunity.pack.html-css" },
	{ import = "astrocommunity.pack.java" },
	{ import = "astrocommunity.pack.json" },
	{ import = "astrocommunity.pack.kotlin" },
	{ import = "astrocommunity.pack.lua" },
	{ import = "astrocommunity.pack.markdown" },
	{ import = "astrocommunity.pack.prisma" },
	{ import = "astrocommunity.pack.python" },
	{ import = "astrocommunity.pack.tailwindcss" },
	{ import = "astrocommunity.pack.toml" },
	{ import = "astrocommunity.pack.typescript" },
	{ import = "astrocommunity.pack.yaml" },

	{ import = "astrocommunity.project.projectmgr-nvim" },

	{ import = "astrocommunity.register.nvim-neoclip-lua" }, -- Yank manager

	{ import = "astrocommunity.scrolling.neoscroll-nvim" },
	{ import = "astrocommunity.scrolling.nvim-scrollbar" },

	{ import = "astrocommunity.search.sad-nvim" },

	-- { import = "astrocommunity.split-and-window.edgy-nvim" },

	{ import = "astrocommunity.utility.nvim-toggler" }, -- Toggle words
	{ import = "astrocommunity.utility.noice-nvim" },

	-- Learning good vim
	-- { import = "astrocommunity.workflow.hardtime-nvim" },
}
