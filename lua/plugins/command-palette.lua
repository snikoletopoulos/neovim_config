function Command_palette()
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
end

---@type LazySpec
return {
	{
		"ray-x/sad.nvim",
		cmd = { "SearchAndReplace" },
		specs = {
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
}
