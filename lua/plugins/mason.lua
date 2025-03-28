---@type LazySpec
return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				-- language servers
				"gradle-language-server",
				"graphql-language-service-cli",
				-- TODO: wait for mason 1.11.0 release
				-- "nginx-language-server",
				"rust-analyzer",

				-- none-ls
				"checkmake",
				"clang-format",
				"cspell",
				"markdownlint",
				"mypy",
				"npm-groovy-lint",
				"pylint",
				"stylelint",
				"sql-formatter",
				"yamllint",

				-- install any other package
				"tree-sitter-cli",
			},
			auto_update = true,
		},
	},
}
