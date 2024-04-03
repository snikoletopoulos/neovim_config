---@type LazySpec
return {
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
						{ "Restart eslint_d", ":!eslint_d restart" },
						{ "Restart tsserver", ":LspRestart tsserver" },
					},
					{
						"File",
						{ "Search and Replace", ":Sad", 1 },
						{ "Search and Replace current word", ":Sad" },
						{ "Inspect types", ":InspectTwoslashQueries" },
					},
					{
						"Packages",
						{ "Update Plugins and Mason", ":AstroUpdatePackages" },
						{ "Mason Update", ":MasonUpdate" },
						{ "Open Mason", ":Mason" },
						{ "Plugins Status", ":lua require('lazy').home()" },
						{ "Plugins Update", ":lua require('lazy').update()" },
						{ "Plugins Sync", ":lua require('lazy').sync()" },
					},
					{
						"Vim",
						{ "Commands", ":lua require('telescope.builtin').commands()" },
						{
							"Command history",
							":lua require('telescope.builtin').command_history()",
						},
						{ "Vim options", ":lua require('telescope.builtin').vim_options()" },
						{ "Check health", ":checkhealth" },
						{
							"Change colorshceme",
							":lua require('telescope.builtin').colorscheme({ enable_preview = true })",
						},
					},
				},
			},
		},
	},
}
