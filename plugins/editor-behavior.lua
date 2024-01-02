local neo_tree_events = require("neo-tree.events")

local function on_file_remove(args)
	local ts_clients = vim.lsp.get_active_clients({ name = "tsserver" })
	for _, ts_client in ipairs(ts_clients) do
		ts_client.request("workspace/executeCommand", {
			command = "_typescript.applyRenameFile",
			arguments = {
				{
					sourceUri = vim.uri_from_fname(args.source),
					targetUri = vim.uri_from_fname(args.destination),
				},
			},
		})
	end
end

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
					["<C-x"] = "open_split",
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
				-- TODO: Hide cursor when entering neotree
				-- { event = "neo_tree_buffer_enter",       handler = function() vim.cmd 'highlight! Cursor blend=100' end },
				-- cspell:disable-next
				-- { event = "neo_tree_buffer_leave",       handler = function() vim.cmd 'highlight! Cursor guibg=#5f87af blend=0' end },
				{ event = neo_tree_events.FILE_RENAMED, handler = on_file_remove },
				{ event = neo_tree_events.FILE_MOVED, handler = on_file_remove },
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
	-- TODO: testing
	-- {
	-- 	"karb94/neoscroll.nvim",
	-- 	opts = {
	-- 		post_hook = function()
	-- 			vim.fn.feedkeys("M")
	-- 		end,
	-- 	},
	-- },
	-- NOTE: Vim plugin
	{ "mg979/vim-visual-multi", lazy = false },
	{
		"pocco81/auto-save.nvim",
		event = "VeryLazy",
		keys = { { "<leader>fa", ":ASToggle<CR>", desc = "Toggle auto-save" } },
		opts = {
			debounce_delay = 1000,
			execution_message = {
				message = function()
					return ""
				end,
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		lazy = false,
		opts = {
			mode = "topline",
			separator = "",
			max_lines = 8,
			trim_scope = "outer",
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
				"[h",
				function()
					require("harpoon.ui").nav_prev()
				end,
				desc = "Previous Harpoon file",
			},
			{
				"]h",
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
	-- NOTE: Vim plugin
	{
		"s1n7ax/nvim-window-picker",
		opts = { show_prompt = false },
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = "SmiteshP/nvim-navbuddy",
	},
	-- NOTE: Vim plugin
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
	-- NOTE: Vim plugin
	{
		"Wansmer/treesj",
		keys = {
			{
				"<leader>m",
				function()
					require("treesj").toggle()
				end,
				desc = "Split/join block",
			},
			{
				"<leader>M",
				function()
					require("treesj").toggle({ split = { recursive = true } })
				end,
				desc = "Split/join block recursively",
			},
		},
	},
	{
		"nvim-neorg/neorg",
		dependencies = { { "nvim-lua/plenary.nvim" } },
		event = "VeryLazy",
		build = ":Neorg sync-parsers",
		opts = {
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {
					config = { icon_preset = "diamond" },
				},
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/notes",
							current_dir = ".",
						},
						default_workspace = "notes",
					},
				},
				["core.completion"] = {
					config = {
						engine = "nvim-cmp",
					},
				},
				["core.integrations.nvim-cmp"] = {},
			},
		},
	},
	-- TODO: Missing api key
	-- {
	--   "jackMort/ChatGPT.nvim",
	--   event = "VeryLazy",
	--   opts = {},
	--   dependencies = {
	--     "MunifTanjim/nui.nvim",
	--     "nvim-lua/plenary.nvim",
	--     "nvim-telescope/telescope.nvim"
	--   }
	-- },
	{
		"akinsho/toggleterm.nvim",
		opts = {
			float_opts = {
				width = 1000,
				height = 1000,
			},
		},
	},
}
