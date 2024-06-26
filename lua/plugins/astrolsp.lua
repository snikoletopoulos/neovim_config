---@type LazySpec
return {
	"AstroNvim/astrolsp",
	dependencies = {
		"simrat39/rust-tools.nvim",
		"davidosomething/format-ts-errors.nvim",
	},
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
			lua_ls = { settings = { Lua = { hint = { enable = true } } } },
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
			vtsls = {
				settings = {
					typescript = {
						inlayHints = {
							parameterNames = { enabled = "all", suppressWhenArgumentMatchesName = false },
							parameterTypes = { enabled = true },
							variableTypes = { enabled = false, suppressWhenTypeMatchesName = true },
							propertyDeclarationTypes = { enabled = true },
							functionLikeReturnTypes = { enabled = true },
							enumMemberValues = { enabled = false },
						},
					},
					javascript = {
						inlayHints = {
							parameterNames = { enabled = "all", suppressWhenArgumentMatchesName = true },
							parameterTypes = { enabled = true },
							variableTypes = { enabled = false, suppressWhenTypeMatchesName = true },
							propertyDeclarationTypes = { enabled = true },
							functionLikeReturnTypes = { enabled = true },
							enumMemberValues = { enabled = false },
						},
					},
				},
				handlers = {
					---@diagnostic disable-next-line: redundant-parameter
					["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
						if result.diagnostics == nil then return end

						-- ignore some tsserver diagnostics
						local idx = 1
						while idx <= #result.diagnostics do
							local entry = result.diagnostics[idx]

							local formatter = require("format-ts-errors")[entry.code]
							entry.message = formatter and formatter(entry.message) or entry.message

							-- codes: https://github.com/microsoft/TypeScript/blob/main/src/compiler/diagnosticMessages.json
							if entry.code == 80001 then
								-- { message = "File is a CommonJS module; it may be converted to an ES module.", }
								table.remove(result.diagnostics, idx)
							else
								idx = idx + 1
							end
						end

						vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
					end,
				},
				on_attach = function(client, bufnr) require("twoslash-queries").attach(client, bufnr) end,
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
		},
		mappings = {
			n = {
				["<Leader>uY"] = false,
				["<Leader>lG"] = false,
				["<Leader>lR"] = false,
			},
			v = { ["<leader>uY"] = false },
		},
	},
}
