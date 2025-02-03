---@type LazySpec
return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		keys = {
			{
				"<leader>ue",
				":Neotree toggle action=show<CR>",
				desc = "Toggle Explorer",
			},
		},
		opts = function(_, opts)
			local neo_tree_events = require("neo-tree.events")

			return require("astrocore").extend_tbl(opts, {
				window = {
					width = 40,
					mappings = {
						["<C-x>"] = "open_split",
						["<C-v>"] = "open_vsplit",
					},
				},
				tabs_layout = "focus",
				sort_case_insensitive = true,
				sources = { "filesystem" },
				filesystem = {
					renderers = {
						directory = {
							{ "indent" },
							{ "icon" },
							{ "current_filter" },
							{
								"container",
								content = {
									{ "name", zindex = 10 },
									{ "clipboard", zindex = 10 },
									{
										"diagnostics",
										zindex = 20,
										align = "right",
										hide_when_expanded = true,
									},
									{
										"git_status",
										zindex = 20,
										align = "right",
										hide_when_expanded = true,
									},
								},
							},
						},
						file = {
							{ "indent" },
							{ "icon" },
							{
								"container",
								content = {
									{ "name", zindex = 10, use_git_status_colors = true },
									{ "clipboard", zindex = 10 },
									{ "bufnr", zindex = 10 },
									{ "modified", zindex = 20, align = "right" },
									{ "diagnostics", zindex = 20, align = "right" },
									{ "git_status", zindex = 20, align = "right" },
								},
							},
						},
					},
				},
				event_handlers = {
					{
						event = neo_tree_events.NEO_TREE_WINDOW_AFTER_OPEN,
						handler = function()
							vim.cmd("wincmd =")
							Snacks.dashboard.update()
						end,
					},
					{
						event = neo_tree_events.NEO_TREE_WINDOW_AFTER_CLOSE,
						handler = function()
							vim.cmd("wincmd =")
							Snacks.dashboard.update()
						end,
					},
				},
			})
		end,
	},
	{
		"s1n7ax/nvim-window-picker",
		opts = { show_prompt = false },
	},
}
