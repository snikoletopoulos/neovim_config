---@type LazySpec
return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
				"gradle_ls",
				"graphql",
				"somesass_ls",
			})

			require("utils.helpers"):remove_list_value(opts.ensure_installed, "eslint")
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		opts = function(_, opts)
			opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
				"cspell",
				"markdownlint",
				-- "jsonlint",
				"eslint_d",
				"mypy",
				-- "pydocstyle",
				"pylint",
				"stylelint",
				"sql_formatter",
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
