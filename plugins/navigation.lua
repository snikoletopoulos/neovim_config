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
						local harpoon = require("harpoon")
						local path = node:get_id()

						local index = -1
						for i, item in ipairs(harpoon:list():display()) do
							if string.match(path, item) then
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
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		branch = "harpoon2",

		keys = function(_, keys)
			local harpoon = require("harpoon")

			print(vim.inspect(harpoon:list():get_by_display("src/middleware.ts")))
			return vim.tbl_deep_extend("error", keys, {
				{
					"<leader>hh",
					function()
						harpoon.ui:toggle_quick_menu(harpoon:list())
					end,
					desc = "Toggle Harpoon",
				},
				{
					"<leader>uh",
					function()
						local conf = require("telescope.config").values
						local harpoon_files = require("harpoon"):list()

						local file_paths = {}
						for _, item in ipairs(harpoon_files.items) do
							table.insert(file_paths, item.value)
						end

						require("telescope.pickers")
							.new({}, {
								prompt_title = "Harpoon",
								finder = require("telescope.finders").new_table({
									results = file_paths,
								}),
								previewer = conf.file_previewer({}),
								sorter = conf.generic_sorter({}),
							})
							:find()
					end,
					desc = "Toggle Harpoon",
				},
				{
					"<leader>ha",
					function()
						harpoon:list():append()
					end,
					desc = "Add file to Harpoon",
				},
				{
					"[h",
					function()
						harpoon:list():prev()
					end,
					desc = "Previous Harpoon file",
				},
				{
					"]h",
					function()
						harpoon:list():next()
					end,
					desc = "Next Harpoon file",
				},
				{
					"<C-x>",
					function()
						vim.ui.input({ prompt = "Harpoon mark index: " }, function(input)
							local num = tonumber(input)
							if num then
								require("harpoon"):list():select(num)
							end
						end)
					end,
					desc = "Goto index of mark",
				},
			})
		end,
		config = function()
			local harpoon = require("harpoon")
			local extensions = require("harpoon.extensions")

			harpoon:setup()
			harpoon:extend(extensions.builtins.navigate_with_number())
			-- Add keymaps for harpoon window
			harpoon:extend({
				UI_CREATE = function(cx)
					vim.keymap.set("n", "<C-v>", function()
						harpoon.ui:select_menu_item({ vsplit = true })
					end, { buffer = cx.bufnr })

					vim.keymap.set("n", "<C-x>", function()
						harpoon.ui:select_menu_item({ split = true })
					end, { buffer = cx.bufnr })
				end,
			})
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
