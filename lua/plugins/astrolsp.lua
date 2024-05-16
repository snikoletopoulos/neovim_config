---@type LazySpec
return {
	"AstroNvim/astrolsp",
	dependencies = { "simrat39/rust-tools.nvim" },
	---@type AstroLSPOpts
	opts = {
		features = {
			autoformat = true,
			codelens = true,
			inlay_hints = true,
			semantic_tokens = true,
		},
		formatting = {
			format_on_save = { enabled = false },
			timeout_ms = 2000,
			filter = function(client)
				if vim.bo.filetype == "rust" then return client.name == "rust-analyzer" end
				return client.name == "null-ls"
			end,
		},
		---@diagnostic disable: missing-fields
		config = {
			lua_ls = { settings = { Lua = { hint = { enable = true, arrayIndex = "Auto" } } } },
			emmet_ls = {
				init_options = {
					jsx = {
						options = {
							["jsx.enabled"] = true,
							["output.selfClosingStyle"] = "xhtml",
							["bem.enabled"] = true,
						},
					},
				},
			},
			["typescript-tools"] = {
				on_attach = function(client, bufnr) require("twoslash-queries").attach(client, bufnr) end,
				settings = {
					expose_as_code_action = "all",
					disable_member_code_lens = false,
					tsserver_file_preferences = {
						preferTypeOnlyAutoImports = true,
					},
				},
			},
		},
		setup_handlers = {
			rust_analyzer = function(_, opts)
				require("rust-tools").setup({
					tools = {
						show_parameter_hints = true,
						other_hints_prefix = "=> ",
						highlight = "Comment",

						auto = true,
						only_current_line = true,
						right_align_padding = 7,
						right_align = false,
						max_len_align_padding = 1,
						max_len_align = false,
					},
					server = opts,
				})
			end,
		},
		autocmds = {
			eslint_fix_on_save = false,
			mappings = {
				n = {
					["<Leader>uY"] = false,
					["<Leader>lG"] = false,
					["<Leader>lR"] = false,
				},
				v = { ["<leader>uY"] = false },
			},
		},
	},
}
