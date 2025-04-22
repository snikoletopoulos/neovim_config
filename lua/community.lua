---@type LazySpec
return {
	"AstroNvim/astrocommunity",
	{ import = "astrocommunity.color.tint-nvim" }, -- Dim inactive windows

	-- { import = "astrocommunity.completion.avante-nvim" },
	{ import = "astrocommunity.completion.copilot-lua" },
	-- { import = "astrocommunity.completion.supermaven-nvim" },

	{ import = "astrocommunity.debugging.nvim-chainsaw" }, -- Logging

	{ import = "astrocommunity.docker.lazydocker" },

	{ import = "astrocommunity.editing-support.auto-save-nvim" },
	{ import = "astrocommunity.editing-support.cloak-nvim" }, -- Hide env variables
	{ import = "astrocommunity.editing-support.chatgpt-nvim" },
	{ import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
	{ import = "astrocommunity.editing-support.treesj" }, -- Fold/Unfold code blocks

	{ import = "astrocommunity.git.blame-nvim" },
	{ import = "astrocommunity.git.diffview-nvim" },

	{ import = "astrocommunity.markdown-and-latex.render-markdown-nvim" },

	{ import = "astrocommunity.motion.nvim-surround" },
	{ import = "astrocommunity.motion.mini-move" }, -- Move lines with <M>
	{ import = "astrocommunity.motion.mini-ai" }, -- visual mode textobject selection for i/a

	{ import = "astrocommunity.neovim-lua-development.helpview-nvim" },

	{ import = "astrocommunity.pack.astro" },
	{ import = "astrocommunity.pack.bash" },
	{ import = "astrocommunity.pack.cpp" },
	{ import = "astrocommunity.pack.docker" },
	{ import = "astrocommunity.pack.go" },
	{ import = "astrocommunity.pack.html-css" },
	{ import = "astrocommunity.pack.java" },
	{ import = "astrocommunity.pack.json" },
	{ import = "astrocommunity.pack.kotlin" },
	{ import = "astrocommunity.pack.lua" },
	{ import = "astrocommunity.pack.markdown" },
	{ import = "astrocommunity.pack.prisma" },
	{ import = "astrocommunity.pack.python" },
	{ import = "astrocommunity.pack.ruby" },
	{ import = "astrocommunity.pack.rust" },
	{ import = "astrocommunity.pack.sql" },
	{ import = "astrocommunity.pack.tailwindcss" },
	{ import = "astrocommunity.pack.toml" },
	{ import = "astrocommunity.pack.typescript" },
	{ import = "astrocommunity.pack.yaml" },

	{ import = "astrocommunity.quickfix.nvim-bqf" }, -- Quick fix list preview

	{ import = "astrocommunity.recipes.disable-tabline" },
	{ import = "astrocommunity.recipes.heirline-vscode-winbar" },
	{ import = "astrocommunity.recipes.picker-lsp-mappings" },

	{ import = "astrocommunity.scrolling.nvim-scrollbar" },

	{ import = "astrocommunity.search.sad-nvim" },

	{ import = "astrocommunity.test.neotest" },

	{ import = "astrocommunity.utility.nvim-toggler" }, -- Toggle words
	{ import = "astrocommunity.utility.noice-nvim" },
}
