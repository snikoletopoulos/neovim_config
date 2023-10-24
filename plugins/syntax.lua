return {
	{
		"styled-components/vim-styled-components",
		ft = { "js", "jsx", "ts", "tsx" },
	},
	{
		"NvChad/nvim-colorizer.lua",
		lazy = false,
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
		lazy = false,
		keys = {
			{ "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Find todos" },
		},
		dependencies = "nvim-lua/plenary.nvim",
		opts = {
			highlight = {
				pattern = [[.*<(KEYWORDS)\s*]],
			},
			search = {
				pattern = [[\b(KEYWORDS)\b]],
			},
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		dependencies = { "TheGLander/indent-rainbowline.nvim" },
		opts = function(_, opts)
			local new_opts = opts -- require("indent-rainbowline").make_opts(opts, { color_transparency = 0.05 })

			new_opts.indent = {
				smart_indent_cap = true,
			}

			new_opts.whitespace = {
				remove_blankline_trail = true,
			}

			return new_opts
		end,
	},
}
