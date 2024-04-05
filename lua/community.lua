---@type LazySpec
return {
	"AstroNvim/astrocommunity",
	{ import = "astrocommunity.color.tint-nvim" }, -- Dim inactive windows

	{ import = "astrocommunity.completion.copilot-lua" },

	{ import = "astrocommunity.debugging.nvim-bqf" }, -- Quick fix list preview
	{ import = "astrocommunity.debugging.nvim-chainsaw" }, -- Logging

	{ import = "astrocommunity.editing-support.cloak-nvim" }, -- Hide env variables
	{ import = "astrocommunity.editing-support.chatgpt-nvim" },
	{ import = "astrocommunity.editing-support.multicursors-nvim" },
	{ import = "astrocommunity.editing-support.todo-comments-nvim" },
	{ import = "astrocommunity.editing-support.treesj" }, -- Fold/Unfold code blocks

	{ import = "astrocommunity.lsp.nvim-lsp-file-operations" }, -- Fix import when renaming/moving files

	{ import = "astrocommunity.motion.nvim-surround" },
	{ import = "astrocommunity.motion.mini-move" }, -- Move lines with <M>
	-- NOTE: Vim plugin
	{ import = "astrocommunity.motion.vim-matchup" }, -- Better % motion
	-- TODO: write better comment what this does
	{ import = "astrocommunity.motion.mini-ai" }, -- a/i movements

	{ import = "astrocommunity.pack.astro" },
	{ import = "astrocommunity.pack.bash" },
	{ import = "astrocommunity.pack.cpp" },
	{ import = "astrocommunity.pack.docker" },
	{ import = "astrocommunity.pack.html-css" },
	-- { import = "astrocommunity.pack.java" },
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

	{ import = "astrocommunity.recipes.disable-tabline" },
	{ import = "astrocommunity.recipes.heirline-mode-text-statusline" },
	{ import = "astrocommunity.recipes.heirline-vscode-winbar" },
	{ import = "astrocommunity.recipes.neovide" },
	{ import = "astrocommunity.recipes.telescope-nvchad-theme" },
	{ import = "astrocommunity.recipes.vscode-icons" },
	{ import = "astrocommunity.recipes.vscode" },

	{ import = "astrocommunity.register.nvim-neoclip-lua" }, -- Yank manager

	{ import = "astrocommunity.scrolling.neoscroll-nvim" },
	{ import = "astrocommunity.scrolling.nvim-scrollbar" },

	{ import = "astrocommunity.search.sad-nvim" },

	{ import = "astrocommunity.utility.nvim-toggler" }, -- Toggle words
	{ import = "astrocommunity.utility.noice-nvim" },
}
