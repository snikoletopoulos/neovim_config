---@type LazySpec
return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
				"gradle_ls",
				"graphql",
				"rust_analyzer",
				"somesass_ls",
			})

			require("utils.helpers"):remove_list_value(opts.ensure_installed, "eslint")
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
				"eslint_d",
				"mypy",
				-- "pydocstyle",
				"pylint",
				"stylelint",
				"sql_formatter",
				"sqlfluff",
				"yamllint",
			})

			opts.handlers = nil
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
