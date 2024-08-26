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
			{ "petertriho/cmp-git", ft = "gitcommit", opts = {} },
			{ "davidsierradz/cmp-conventionalcommits" },
		},
		---@param opts cmp.ConfigSchema
		opts = function(_, opts)
			local cmp = require("cmp")

			opts.sources = cmp.config.sources({
				{ name = "nvim_lua", priority = 1250 },
				{ name = "nvim_lsp", priority = 1000 },
				{ name = "luasnip", priority = 500 },
				{ name = "npm", priority = 400 },
				{ name = "path", priority = 200 },
			}, {
				{
					name = "buffer",
					priority = 300,
					keyword_length = 5,
					max_item_count = 5,
				},
			})

			opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
				local luasnip = require("luasnip")
				if luasnip.locally_jumpable(1) then
					luasnip.jump(1)
				else
					fallback()
				end
			end, { "i", "s" })

			opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
				local luasnip = require("luasnip")
				if luasnip.locally_jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" })
			opts.mapping["<CR>"] = cmp.mapping.confirm({ select = true })
			opts.mapping["<C-Space>"] = cmp.mapping(function()
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
				kind.menu = (strings[3] or "") .. " " .. (kind.menu or "[Color]")

				return kind
			end

			---@diagnostic disable-next-line: missing-fields
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
		config = function(plugin, opts)
			require("astronvim.plugins.configs.cmp")(plugin, opts)
			local cmp = require("cmp")

			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					{ name = "conventionalcommits" },
					{ name = "git" },
				}, {
					{ name = "path" },
					{
						name = "buffer",
						priority = 300,
						keyword_length = 5,
						max_item_count = 5,
					},
				}),
			})

			cmp.setup.filetype("norg", {
				sources = cmp.config.sources({
					{ name = "neorg" },
				}, {
					{ name = "path" },
					{
						name = "buffer",
						priority = 300,
						keyword_length = 5,
						max_item_count = 5,
					},
				}),
			})
		end,
	},
}
