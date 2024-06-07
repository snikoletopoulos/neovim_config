---@type LazySpec
return {
	{
		"ray-x/sad.nvim",
		cmd = { "SearchAndReplace" },
		config = function(_, opts)
			require("sad").setup(opts)

			vim.api.nvim_create_user_command("SearchAndReplace", function(params)
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
			end, { nargs = "?" })
		end,
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
						{ "Restart eslint", ":!LspRestart eslint" },
						{ "Restart tsserver", ":LspRestart tsserver" },
					},
					{
						"File",
						{ "Toggle env variables", "CloakToggle" },
						{ "Search and Replace", ":SearchAndReplace" },
						{ "Inspect types", ":InspectTwoslashQueries" },
					},
					{
						"Packages",
						{ "Mason Update", ":AstroMasonUpdateAll" },
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
					},
				},
			},
		},
	},
}
