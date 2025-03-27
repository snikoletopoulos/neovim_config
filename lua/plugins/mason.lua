---@type LazySpec
return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"checkmake",
				"cspell",
				"markdownlint",
				"mypy",
				"pylint",
				"stylelint",

				-- install any other package
				-- "tree-sitter-cli",
			},
		},
	},
}
