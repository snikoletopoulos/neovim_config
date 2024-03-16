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
			{ "<leader>cv", "<cmd>lua require('chainsaw').variableLog()<CR>", desc = "Log variable" },
			{ "<leader>co", "<cmd>lua require('chainsaw').objectLog()<CR>", desc = "Log object" },
			{ "<leader>cm", "<cmd>lua require('chainsaw').messageLog()<CR>", desc = "Log" },
			{ "<leader>cb", "<cmd>lua require('chainsaw').beepLog()<CR>", desc = "Log beep" },
			{ "<leader>cr", "<cmd>lua require('chainsaw').removeLogs()<CR>", desc = "Clear logs" },
		},
		opts = function(_, opts)
			for _, language in pairs(astronvim.user_opts("utils.constants").filetype.javascript) do
				if opts.logStatements == nil then
					opts.logStatements = { objectLog = {} }
				end
				print(language)
				opts.logStatements.objectLog[language] =
					'console.log("%s %s:", JSON.stringify(%s, null, 2));'
			end
			return opts
		end,
	},
}
