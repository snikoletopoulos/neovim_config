---@type LazySpec
return {
	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		branch = "harpoon2",
		keys = function(_, keys)
			local harpoon = require("harpoon")

			return require("astrocore").extend_tbl(keys, {
				{
					"<leader>hh",
					function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
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
					function() harpoon:list():add() end,
					desc = "Add file to Harpoon",
				},
				{
					"<C-p>",
					function() harpoon:list():prev() end,
					desc = "Previous Harpoon file",
				},
				{
					"<C-n>",
					function() harpoon:list():next() end,
					desc = "Next Harpoon file",
				},
				{
					"<leader>fh",
					function()
						Snacks.input({ prompt = "Harpoon mark index: " }, function(input)
							local num = tonumber(input)
							if num then require("harpoon"):list():select(num) end
						end)
					end,
					desc = "Goto index of mark",
				},
			})
		end,
		config = function(_, opts)
			local harpoon = require("harpoon")
			local extensions = require("harpoon.extensions")

			harpoon:setup(opts)
			harpoon:extend(extensions.builtins.navigate_with_number())
			-- Add keymaps for harpoon window
			harpoon:extend({
				UI_CREATE = function(cx)
					vim.keymap.set(
						"n",
						"<C-v>",
						function() harpoon.ui:select_menu_item({ vsplit = true }) end,
						{ buffer = cx.bufnr }
					)

					vim.keymap.set(
						"n",
						"<C-x>",
						function() harpoon.ui:select_menu_item({ split = true }) end,
						{ buffer = cx.bufnr }
					)
				end,
			})
		end,
	},
}
