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
	{
		"chrisgrieser/nvim-chainsaw",
		keys = {
			{ "<leader>cv", "<cmd>lua require('chainsaw').variableLog()<CR>" },
			{ "<leader>co", "<cmd>lua require('chainsaw').objectLog()<CR>" },
			{ "<leader>cm", "<cmd>lua require('chainsaw').messageLog()<CR>" },
			{ "<leader>cb", "<cmd>lua require('chainsaw').beepLog()<CR>" },
			{ "<leader>cr", "<cmd>lua require('chainsaw').removeLogs()<CR>" },
		},
		opts = {
			logStatements = {
				objectLog = {
					javascript = 'console.log("%s %s:", JSON.stringify(%s, null, 2));',
					javascriptreact = 'console.log("%s %s:", JSON.stringify(%s, null, 2));',
					typescript = 'console.log("%s %s:", JSON.stringify(%s, null, 2));',
					typescriptreact = 'console.log("%s %s:", JSON.stringify(%s, null, 2));',
				},
			},
		},
	},
}
