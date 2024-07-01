---@type LazySpec
return {
	{
		"numToStr/Comment.nvim",
		config = function()
			local ft = require("Comment.ft")

			local css = ft.get("css")
			if css then ft.set("scss", css) end
		end,
	},
	{
		"axelvc/template-string.nvim",
		ft = require("utils.constants").filetype.javascript,
		opts = {
			jsx_brackets = true,
			remove_template_strings = true,
			restore_quotes = {
				normal = [["]],
				jsx = [["]],
			},
		},
	},
	{
		"Wansmer/treesj",
		keys = {
			{
				"<leader>m",
				function() require("treesj").toggle() end,
				desc = "Split/join block",
			},
			{
				"<leader>M",
				function() require("treesj").toggle({ split = { recursive = true } }) end,
				desc = "Split/join block recursively",
			},
		},
	},
	{
		"marilari88/twoslash-queries.nvim",
		ft = require("utils.constants").filetype.javascript,
	},
	{
		"folke/todo-comments.nvim",
		keys = {
			{ "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Find todos" },
		},
		opts = {
			highlight = { pattern = [[.*<(KEYWORDS)\s*]] },
			search = { pattern = [[\b(KEYWORDS)\b]] },
		},
	},
	{
		"windwp/nvim-ts-autotag",
		opts = {
			opts = { enable_close_on_slash = true },
		},
	},
}
