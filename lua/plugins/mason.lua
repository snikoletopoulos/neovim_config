---@type LazySpec
return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
				"gradle_ls",
				"graphql",
				-- TODO: wait for mason 1.11.0 release
				-- "nginx_language_server",
				"rust_analyzer",
			})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		opts = function(_, opts)
			opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
				"clang_format",
				"cspell",
				"markdownlint",
				-- "jsonlint",
				"mypy",
				"pylint",
				"stylelint",
				"sql_formatter",
				"sqlfluff",
				"yamllint",
			})

			opts.handlers = nil

			return opts
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		opts = function(_, opts)
			opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {})
			return opts
		end,
	},
}
