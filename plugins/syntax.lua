return {
	{
		"NvChad/nvim-colorizer.lua",
		opts = {
			user_default_options = {
				tailwind = true,
				names = true,
				RRGGBBAA = true,
				mode = "background",
			},
		},
	},
	{
		"folke/todo-comments.nvim",
		keys = { { "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Find todos" } },
		opts = {
			highlight = { pattern = [[.*<(KEYWORDS)\s*]] },
			search = { pattern = [[\b(KEYWORDS)\b]] },
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = "User AstroFile",
		dependencies = { "TheGLander/indent-rainbowline.nvim" },
		opts = function(_, opts)
			return require("indent-rainbowline").make_opts(opts, { color_transparency = 0.04 })
		end,
	},
}
