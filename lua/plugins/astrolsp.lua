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
			codelens = true,
			inlay_hints = true,
			semantic_tokens = true,
			signature_help = false,
		},
		formatting = {
			format_on_save = { enabled = false },
			timeout_ms = 1000,
			filter = function(client)
				if vim.bo.filetype == "rust" then return client.name == "rust-analyzer" end
				if vim.bo.filetype == "toml" then return client.name == "taplo" end
				if vim.bo.filetype == "go" then
					return client.name == "gopls" or client.name == "null-ls"
				end
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
							parameterNames = { enabled = "all", suppressWhenArgumentMatchesName = true },
							parameterTypes = { enabled = true },
							variableTypes = { enabled = true, suppressWhenTypeMatchesName = true },
							propertyDeclarationTypes = { enabled = true },
							functionLikeReturnTypes = { enabled = true },
							enumMemberValues = { enabled = false },
						},
					},
					javascript = {
						inlayHints = {
							parameterNames = { enabled = "all", suppressWhenArgumentMatchesName = true },
							parameterTypes = { enabled = true },
							variableTypes = { enabled = true, suppressWhenTypeMatchesName = true },
							propertyDeclarationTypes = { enabled = true },
							functionLikeReturnTypes = { enabled = true },
							enumMemberValues = { enabled = false },
						},
					},
					vtsls = {
						autoUseWorkspaceTsdk = true,
						experimental = {
							enableProjectDiagnostics = true,
							maxInlayHintLength = 30,
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
				on_attach = function(client, bufnr)
					require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
					require("twoslash-queries").attach(client, bufnr)
				end,
			},
		},
		handlers = {
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
		autocmds = { eslint_fix_on_save = false },
		mappings = {
			n = {
				["<Leader>uY"] = false, -- toggle LSP symantic highlighting
				["<Leader>lG"] = false, -- search workspace symbols
				["<Leader>lR"] = false, -- search references
				["<Leader>uf"] = false, -- toggle buffer autoformatting
				["<Leader>uF"] = false, -- toggle global autoformatting
				["<Leader>uh"] = false, -- toggle buffer inlay hints
				["<Leader>uH"] = false, -- toggle global inlay hints
				["<Leader>u?"] = false, -- toggle automatic signature help
				-- TODO: not working
				["gra"] = false, -- gr code actions
				-- TODO: not working
				["grn"] = false, -- gr rename
				-- TODO: not working
				["gri"] = false, -- gr locations
				-- TODO: not working
				["grr"] = false, -- gr search references
			},
			v = {
				["<leader>uY"] = false, -- toggle LSP symantic highlighting
			},
		},
	},
}
