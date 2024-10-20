---@type LazySpec
return {
	"AstroNvim/astrocommunity",
	{ import = "astrocommunity.color.tint-nvim" }, -- Dim inactive windows
	{ import = "astrocommunity.color.nvim-highlight-colors" }, -- Dim inactive windows

	{ import = "astrocommunity.completion.copilot-lua" },

	{ import = "astrocommunity.debugging.nvim-chainsaw" }, -- Logging

	{ import = "astrocommunity.docker.lazydocker" },

	{ import = "astrocommunity.editing-support.cloak-nvim" }, -- Hide env variables
	{ import = "astrocommunity.editing-support.chatgpt-nvim" },
	{ import = "astrocommunity.editing-support.multicursors-nvim" },
	{ import = "astrocommunity.editing-support.todo-comments-nvim" },
	{ import = "astrocommunity.editing-support.telescope-undo-nvim" },
	{ import = "astrocommunity.editing-support.treesj" }, -- Fold/Unfold code blocks

	{ import = "astrocommunity.git.blame-nvim" },
	{ import = "astrocommunity.git.diffview-nvim" },

	{ import = "astrocommunity.icon.mini-icons" },

	{ import = "astrocommunity.lsp.nvim-lsp-file-operations" }, -- Fix import when renaming/moving files
	{ import = "astrocommunity.lsp.actions-preview-nvim" },

	{ import = "astrocommunity.markdown-and-latex.markview-nvim" },

	{ import = "astrocommunity.motion.nvim-surround" },
	{ import = "astrocommunity.motion.mini-move" }, -- Move lines with <M>
	{ import = "astrocommunity.motion.mini-ai" }, -- visual mode textobject selection for i/a

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
	{ import = "astrocommunity.pack.rust" },
	{ import = "astrocommunity.pack.sql" },
	{ import = "astrocommunity.pack.tailwindcss" },
	{ import = "astrocommunity.pack.toml" },
	{ import = "astrocommunity.pack.typescript" },
	{ import = "astrocommunity.pack.yaml" },

	{ import = "astrocommunity.quickfix.nvim-bqf" }, -- Quick fix list preview

	{ import = "astrocommunity.recipes.disable-tabline" },
	{ import = "astrocommunity.recipes.heirline-mode-text-statusline" },
	{ import = "astrocommunity.recipes.heirline-vscode-winbar" },
	{ import = "astrocommunity.recipes.telescope-lsp-mappings" },
	{ import = "astrocommunity.recipes.telescope-nvchad-theme" },
	{ import = "astrocommunity.recipes.vscode-icons" },

	{ import = "astrocommunity.register.nvim-neoclip-lua" }, -- Yank manager

	{ import = "astrocommunity.scrolling.neoscroll-nvim" },
	{ import = "astrocommunity.scrolling.nvim-scrollbar" },

	{ import = "astrocommunity.search.sad-nvim" },

	{ import = "astrocommunity.utility.nvim-toggler" }, -- Toggle words
	{ import = "astrocommunity.utility.noice-nvim" },
}
