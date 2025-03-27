---@type LazySpec
return {
	"AstroNvim/astrocore",
	---@type AstroCoreOpts
	opts = {
		features = {
			large_buf = { size = 1024 * 256, lines = 10000 },
			autopairs = true,
			cmp = true,
			diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
			highlighturl = false, -- TODO: fix underline
			notifications = true,
		},
		diagnostics = {
			virtual_text = true,
			underline = false, -- TODO: fix underline
			severity_sort = true,
			signs = true,
		},
		options = {
			opt = {},
			g = {
				loaded_perl_provider = 0,
			},
		},
		commands = {
			CommandPalette = {
				function()
					local commands = {
						{
							name = "LSP",
							commands = {
								{ "Restart tsserver", ":VtsExec restart_tsserver" },
								{ "Restart eslint", ":LspRestart eslint" },
								{ "Restart prettierd", ":!prettierd restart" },
								{ "Restart lua-ls", ":LspRestart lua-ls" },
							},
						},
						{
							name = "File",
							commands = {
								{ "Inspect types", ":InspectTwoslashQueries" },
								{ "Toggle inline folds", ":InlineFoldToggle" },
								{ "Search and Replace", ":SearchAndReplace" },
								{ "View on GitHub", function() Snacks.gitbrowse() end },
								{ "Toggle env variables", "CloakToggle" },
							},
						},
						{
							name = "Vim",
							commands = {
								{ "Open Lazy", function() require("lazy").home() end },
								{ "Open Mason", ":Mason" },
								{ "Zen mode", function() Snacks.zen() end },
								{ "Check health", ":checkhealth" },
								{
									"Change colorshceme",
									function() Snacks.picker.colorschemes() end,
								},
								{ "Commands", function() Snacks.picker.commands() end },
							},
						},
					}

					vim.ui.select(
						commands,
						{ prompt = "Select category:", format_item = function(item) return item.name end },
						function(category)
							vim.ui.select(
								category.commands,
								{ prompt = "Select command:", format_item = function(item) return item[1] end },

								function(command)
									if type(command[2]) == "function" then
										command[2]()
									elseif type(command[2]) == "string" then
										vim.cmd(command[2])
									end
								end
							)
						end
					)
				end,
				desc = "Command palette",
			},
		},
		-- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
		mappings = {},
		filetypes = {
			extension = {
				env = "dotenv",
				podspec = "ruby",
			},
			filename = {
				[".env"] = "dotenv",
				["tsconfig.json"] = "jsonc",
				[".eslintrc.json"] = "jsonc",
				[".yamlfmt"] = "yaml",
				[".sqlfluff"] = "toml",
				["Podfile"] = "ruby",
				["dot-zshrc"] = "zsh",
			},
			pattern = {
				["%.env%.[%w_.-]+"] = "dotenv",
			},
		},
	},
}
