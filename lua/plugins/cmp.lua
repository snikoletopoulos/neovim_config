---@type LazySpec
return {
	{
		"L3MON4D3/LuaSnip",
		config = function(_, opts)
			require("luasnip").setup(opts)
			require("luasnip.loaders.from_vscode").lazy_load({
				paths = { vim.fn.stdpath("config") .. "/snippets" },
			})
		end,
	},
	{
		"onsails/lspkind.nvim",
		opts = {
			mode = "symbol_text",
			preset = "codicons",
			menu = {
				nvim_lua = "[NeoVim]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				neorg = "[Neorg]",
				npm = "[NPM]",
				buffer = "[Buffer]",
				path = "[Path]",
			},
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lua" },
			{
				"David-Kunz/cmp-npm",
				dependencies = { "nvim-lua/plenary.nvim" },
				ft = "json",
				opts = {},
			},
		},
		---@param opts cmp.ConfigSchema
		opts = function(_, opts)
			local cmp = require("cmp")

			opts.sources = cmp.config.sources({
				{ name = "nvim_lua", priority = 1250 },
				{ name = "nvim_lsp", priority = 1000 },
				{ name = "luasnip", priority = 750 },
				-- { name = "neorg", priority = 700 },
				{ name = "npm", priority = 600 },
				{
					name = "buffer",
					priority = 500,
					keyword_length = 5,
					max_item_count = 5,
				},
				{ name = "path", priority = 250 },
			})

			opts.mapping["<CR>"] = cmp.mapping.confirm({ select = true })
			opts.mapping["<C-m>"] = cmp.mapping(function()
				if cmp.visible() then
					cmp.close()
				else
					cmp.complete()
				end
			end, { "i" })

			local existing_formatter = opts.formatting.format
			opts.formatting.format = function(entry, vim_item)
				local kind = existing_formatter(entry, vim_item)

				local strings = vim.split(kind.kind, "%s", { trimempty = true })
				kind.kind = " " .. (strings[1] or "")
				kind.menu = (strings[3] or "") .. " " .. kind.menu

				return kind
			end

			opts.sorting = {
				comparators = {
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,
					function(first, second)
						local isFirstOptional = first.completion_item
							and first.completion_item.label
							and first.completion_item.label:sub(-1) == "?"
						local isSecondOptional = second.completion_item
							and second.completion_item.label
							and second.completion_item.label:sub(-1) == "?"

						return isSecondOptional and not isFirstOptional
					end,
					cmp.config.compare.recently_used,
					cmp.config.compare.locality,
					cmp.config.compare.kind,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			}

			opts.window = {
				completion = {
					col_offset = -2,
					side_padding = 0,
				},
			}

			return opts
		end,
	},
}
