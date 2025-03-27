---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
			"graphql",
			"make",
			"regex",
			"scss",
			"tmux",
    },
  },
	config = function(plugin, opts)
		require("astronvim.plugins.configs.nvim-treesitter")(plugin, opts)
		vim.treesitter.language.register("bash", "dotenv")
	end,
}
