local utils = require("astronvim.utils")

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, {
				"graphql",
				"regex",
				"swift",
			})
			return opts
		end,
		config = function(_, opts)
			require("nvim-treesitter.install").compilers = { "gcc-13" }
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, {
				"gradle_ls",
				"graphql",
			})

			astronvim.user_opts("utils.helpers"):remove_list_value(opts.ensure_installed, "eslint")

			return opts
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		opts = function(_, opts)
			opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, {
				"cspell",
				"markdownlint",
				"jsonlint",
				"eslint_d",
				"mypy",
				"pydocstyle",
				"pylint",
				"sql_formatter",
				"yamllint",
			})

			astronvim.user_opts("utils.helpers"):remove_list_value(opts.ensure_installed, "eslint-lsp")

			opts.automatic_installation = true

			return opts
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		opts = function(_, opts)
			opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, {})
			return opts
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		opts = function(_, opts)
			local null_ls = require("null-ls")

			opts.sources = {
				-- Code Actions
				null_ls.builtins.code_actions.cspell,
				null_ls.builtins.code_actions.eslint_d,
				null_ls.builtins.code_actions.shellcheck,
				require("typescript.extensions.null-ls.code-actions"),

				-- Completion
				null_ls.builtins.completion.tags,

				-- Diagnostics
				null_ls.builtins.diagnostics.cspell,
				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.diagnostics.dotenv_linter.with({
					filetypes = { "dotenv" },
				}),
				null_ls.builtins.diagnostics.jsonlint,
				null_ls.builtins.diagnostics.luacheck,
				null_ls.builtins.diagnostics.markdownlint,
				null_ls.builtins.diagnostics.hadolint, -- Linter for docker
				null_ls.builtins.diagnostics.mypy,
				null_ls.builtins.diagnostics.pydocstyle,
				null_ls.builtins.diagnostics.pylint,
				null_ls.builtins.diagnostics.shellcheck,
				null_ls.builtins.diagnostics.stylelint.with({
					extra_args = function()
						local null_ls_utils = require("null-ls.utils").make_conditional_utils()
						local has_project_config = null_ls_utils.root_has_file({
							".stylelintrc.js",
							"stylelint.config.js",
							".stylelintrc.mjs",
							"stylelint.config.mjs",
							".stylelintrc.cjs",
							"stylelint.config.cjs",
							".stylelintrc.json",
							".stylelintrc.yml",
							".stylelintrc.yaml",
						})
						if has_project_config then
							return nil
						end
						return {
							"--config",
							vim.fn.stdpath("config") .. "/lua/user/config_files/.stylelintrc.json",
						}
					end,
				}),
				null_ls.builtins.diagnostics.yamllint.with({
					env = {
						YAMLLINT_CONFIG_FILE = vim.fn.stdpath("config")
							.. "/lua/user/config_files/.yamllint.yaml",
					},
				}),
				null_ls.builtins.diagnostics.zsh,

				-- Formatting
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.json_tool,
				null_ls.builtins.formatting.markdownlint,
				null_ls.builtins.formatting.nginx_beautifier,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.clang_format, -- For Java
				null_ls.builtins.formatting.prismaFmt,
				null_ls.builtins.formatting.shfmt,
				null_ls.builtins.formatting.stylua,
			}
			return opts
		end,
	},
}
