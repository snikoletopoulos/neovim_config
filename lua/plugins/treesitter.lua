---@type LazySpec
return {
	"nvim-treesitter/nvim-treesitter",
	opts = function(_, opts)
		opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
			"graphql",
			"make",
			"regex",
			"scss",
			"tmux",
		})
	end,
	config = function(plugin, opts)
		require("astronvim.plugins.configs.nvim-treesitter")(plugin, opts)
		vim.treesitter.language.register("bash", "dotenv")
	end,
}
