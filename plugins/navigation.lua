local neo_tree_events = require("neo-tree.events")

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
		opts = {
			window = {
				width = 40,
				mappings = {
					["<C-x>"] = "open_split",
					["<C-v>"] = "open_vsplit",
				},
			},
			tabs_layout = "focus",
			sort_case_insensitive = true,
			sources = { "filesystem", "buffers", "git_status" },
			source_selector = {
				show_scrolled_off_parent_node = true,
				sources = {
					{ source = "filesystem" },
					{ source = "buffers" },
					{ source = "git_status" },
				},
			},
			filesystem = {
				components = {
					harpoon_index = function(config, node)
						local Marked = require("harpoon.mark")
						local path = node:get_id()
						local succuss, index = pcall(Marked.get_index_of, path)
						if succuss and index and index > 0 then
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
					handler = function()
						vim.cmd("wincmd =")
					end,
				},
				{
					event = neo_tree_events.NEO_TREE_WINDOW_AFTER_CLOSE,
					handler = function()
						vim.cmd("wincmd =")
					end,
				},
			},
		},
	},
	{
		"ThePrimeagen/harpoon",
		dependencies = "nvim-telescope/telescope.nvim",
		keys = {
			{
				"<leader>hh",
				function()
					require("harpoon.ui").toggle_quick_menu()
				end,
				desc = "Toggle Harpoon",
			},
			{
				"<leader>uh",
				"<cmd>Telescope harpoon marks<CR>",
				desc = "Toggle Harpoon",
			},
			{
				"<leader>ha",
				function()
					require("harpoon.mark").add_file()
				end,
				desc = "Add file to Harpoon",
			},
			{
				"<C-p>",
				function()
					require("harpoon.ui").nav_prev()
				end,
				desc = "Previous Harpoon file",
			},
			{
				"<C-n>",
				function()
					require("harpoon.ui").nav_next()
				end,
				desc = "Next Harpoon file",
			},
			{
				"<leader>h1",
				function()
					require("harpoon.ui").nav_file(1)
				end,
				desc = "Go to Harpoon file 1",
			},
			{
				"<leader>h2",
				function()
					require("harpoon.ui").nav_file(2)
				end,
				desc = "Go to Harpoon file 2",
			},
			{
				"<leader>h3",
				function()
					require("harpoon.ui").nav_file(3)
				end,
				desc = "Go to Harpoon file 3",
			},
			{
				"<leader>h4",
				function()
					require("harpoon.ui").nav_file(4)
				end,
				desc = "Go to Harpoon file 4",
			},
			{
				"<leader>h5",
				function()
					require("harpoon.ui").nav_file(5)
				end,
				desc = "Go to Harpoon file 5",
			},
		},
		config = function()
			require("telescope").load_extension("harpoon")
		end,
	},
	{
		"s1n7ax/nvim-window-picker",
		opts = { show_prompt = false },
	},
	{
		"SmiteshP/nvim-navbuddy",
		keys = {
			{
				"<leader>fs",
				function()
					require("nvim-navbuddy").open()
				end,
				desc = "Breadcrumb search",
			},
		},
		dependencies = {
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = { lsp = { auto_attach = true } },
	},
	{
		"charludo/projectmgr.nvim",
		keys = {
			{ "<leader>P", enabled = false },
			{ "<leader>fp", "<cmd>ProjectMgr<cr>", desc = "Change project" },
		},
	},
}
