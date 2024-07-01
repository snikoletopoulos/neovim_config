---@type LazySpec
return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		keys = {
			{
				"<leader>ue",
				"<cmd>Neotree toggle action=show<cr>",
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
					components = {
						harpoon_index = function(config, node)
							local harpoon = require("harpoon")
							local path = node:get_id()

							local index = -1
							for i, item in ipairs(harpoon:list():display()) do
								if item ~= "" and string.match(path, item) then
									index = i
									break
								end
							end

							if index > 0 then
								return {
									text = string.format(" ⥤ %d", index),
									highlight = config.highlight or "NeoTreeDirectoryIcon",
								}
							else
								return {}
							end
						end,
					},
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
									{ "harpoon_index", zindex = 10 },
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
						handler = function() vim.cmd("wincmd =") end,
					},
					{
						event = neo_tree_events.NEO_TREE_WINDOW_AFTER_CLOSE,
						handler = function() vim.cmd("wincmd =") end,
					},
					{
						event = "neo_tree_buffer_enter",
						handler = function() vim.cmd("highlight! Cursor blend=100") end,
					},
					{
						event = "neo_tree_buffer_leave",
						handler = function() vim.cmd("highlight! Cursor guibg=#5f87af blend=0") end,
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
