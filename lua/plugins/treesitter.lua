---@type LazySpec
return {
	"nvim-treesitter/nvim-treesitter",
	opts = function(_, opts)
		opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
			"graphql",
			"regex",
			"scss",
			"swift",
		})
	end,
	config = function(plugin, opts)
		-- TODO: on neorg
		-- require("nvim-treesitter.install").compilers = { "gcc-13" }
		-- require("nvim-treesitter.configs").setup(opts)
		require("astronvim.plugins.configs.nvim-treesitter")(plugin, opts)
		vim.treesitter.language.register("bash", "dotenv")
	end,
}
