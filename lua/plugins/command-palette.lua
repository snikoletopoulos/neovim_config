---@type LazySpec
return {
	{
		"ray-x/sad.nvim",
		cmd = { "SearchAndReplace" },
		dependencies = {
			{
				"AstroNvim/astrocore",
				opts = {
					commands = {
						SearchAndReplace = {
							function(params)
								vim.ui.input({
									prompt = "Search",
									default = params.args[1] or vim.fn.expand("<cword>") or "",
								}, function(search_word)
									if search_word == nil then return end
									vim.ui.input({
										prompt = "Replace",
									}, function(replace_word)
										if replace_word == nil then return end
										vim.ui.input(
											{ prompt = "Filetype" },
											function(filetype) require("sad").Replace(search_word, replace_word, filetype) end
										)
									end)
								end)
							end,
							nargs = "?",
							desc = "Search and replace",
						},
					},
				},
			},
		},
	},
	{
		"LinArcX/telescope-command-palette.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		keys = {
			{
				"<leader>P",
				"<cmd>Telescope command_palette<CR>",
				desc = "Command palette",
			},
		},
		config = function() require("telescope").load_extension("command_palette") end,
	},
	{
		"nvim-telescope/telescope.nvim",
		opts = {
			extensions = {
				command_palette = {
					{
						"LSP",
						{ "Restart lua-ls", ":LspRestart lua-ls" },
						{ "Restart prettierd", ":!prettierd restart" },
						{ "Restart eslint", ":LspRestart eslint" },
						{ "Restart tsserver", ":VtsExec restart_tsserver" },
					},
					{
						"File",
						{ "Toggle env variables", "CloakToggle" },
						{ "View on GitHub", ":lua Snacks.gitbrowse()" },
						{ "Toggle inline folds", ":InlineFoldToggle" },
						{ "Search and Replace", ":SearchAndReplace" },
						{ "Inspect types", ":InspectTwoslashQueries" },
					},
					{
						"Packages",
						{ "Open Mason", ":Mason" },
						{ "Plugins Update", ":lua require('lazy').update()" },
						{ "Plugins Sync", ":lua require('lazy').sync()" },
						{ "Open Lazy", ":lua require('lazy').home()" },
					},
					{
						"Vim",
						{ "Commands", ":lua require('telescope.builtin').commands()" },
						{ "Vim options", ":lua require('telescope.builtin').vim_options()" },
						{
							"Change colorshceme",
							":lua require('telescope.builtin').colorscheme({ enable_preview = true })",
						},
						{ "Check health", ":checkhealth" },
						{ "Zen mode", ":lua Snacks.zen()" },
					},
				},
			},
		},
	},
}
