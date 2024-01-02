return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"astro",
				"bash",
				"css",
				"dockerfile",
				"dot",
				"graphql",
				"html",
				"java",
				"javascript",
				"jsdoc",
				"json",
				"jsonc",
				"kotlin",
				"lua",
				"markdown",
				"markdown_inline",
				"prisma",
				"python",
				"regex",
				"swift",
				"tsx",
				"typescript",
				"yaml",
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.install").compilers = { "gcc-13" }
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"astro",
				"bashls",
				"cssls",
				"cssmodules_ls",
				"dockerls",
				"dotls",
				"emmet_ls",
				"gradle_ls",
				"graphql",
				"html",
				"jsonls",
				"kotlin_language_server",
				"lua_ls",
				"marksman",
				"prismals",
				"pyright",
				"tailwindcss",
				"tsserver",
				"yamlls",
			},
		},
	},
	{
		"jay-babu/mason-null-ls.nvim",
		opts = {
			ensure_installed = {
				"beautysh",
				"cspell",
				"prettierd",
				"luacheck",
				"markdownlint",
				"black",
				"jsonlint",
				"eslint_d",
				"mypy",
				"pydocstyle",
				"pylint",
				"shellcheck",
				"stylua",
				"sql_formatter",
				"yamlfmt",
				"yamllint",
			},
			automatic_installation = true,
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		opts = {
			ensure_installed = { "python", "node2", "chrome", "bash" },
		},
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		opts = function(_, config)
			local null_ls = require("null-ls")

			config.sources = {
				-- Code Actions
				null_ls.builtins.code_actions.cspell,
				null_ls.builtins.code_actions.eslint_d,
				null_ls.builtins.code_actions.shellcheck,
				require("typescript.extensions.null-ls.code-actions"),

				-- Completion
				null_ls.builtins.completion.tags,

				-- Diagnostics
				null_ls.builtins.diagnostics.cspell,
				null_ls.builtins.diagnostics.dotenv_linter,
				null_ls.builtins.diagnostics.eslint_d.with({
					extra_args = { "--cache" },
				}),
				null_ls.builtins.diagnostics.jsonlint,
				null_ls.builtins.diagnostics.luacheck,
				null_ls.builtins.diagnostics.markdownlint,
				null_ls.builtins.diagnostics.mypy,
				null_ls.builtins.diagnostics.pydocstyle,
				null_ls.builtins.diagnostics.pylint,
				null_ls.builtins.diagnostics.shellcheck,
				null_ls.builtins.diagnostics.yamllint,
				null_ls.builtins.diagnostics.zsh,

				-- Formatting
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.json_tool,
				null_ls.builtins.formatting.markdownlint,
				null_ls.builtins.formatting.nginx_beautifier,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.prismaFmt,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.yamlfmt,
			}
			return config
		end,
	},
	{
		"jose-elias-alvarez/typescript.nvim",
		ft = astronvim.user_opts("utils.constants").filetype.javascript,
	},
}
