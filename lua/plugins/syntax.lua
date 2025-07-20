---@type LazySpec
return {
	{
		"chrisgrieser/nvim-chainsaw",
		keys = {
			{ "<leader>cv", function() require("chainsaw").variableLog() end, desc = "Log variable" },
			{ "<leader>co", function() require("chainsaw").objectLog() end, desc = "Log object" },
			{ "<leader>cm", function() require("chainsaw").messageLog() end, desc = "Log" },
			{ "<leader>cb", function() require("chainsaw").emojiLog() end, desc = "Log beep" },
			{ "<leader>cr", function() require("chainsaw").removeLogs() end, desc = "Clear logs" },
		},
		opts = function(_, opts)
			for _, language in pairs(require("utils.constants").filetype.javascript) do
				if opts.logStatements == nil then opts.logStatements = { objectLog = {} } end
				opts.logStatements.objectLog[language] =
					'console.log("{{marker}} {{var}}:", JSON.stringify({{var}}, null, 2));'
			end
			return opts
		end,
	},
	{
		"ghostty",
		dir = vim.fs.joinpath(vim.env.GHOSTTY_RESOURCES_DIR, "..", "nvim", "site"),
		lazy = false,
		cond = vim.env.GHOSTTY_RESOURCES_DIR ~= nil,
	},
	{
		"codethread/qmk.nvim",
		opts = {
			name = "corne",
			variant = "zmk",
			layout = {
				"x x x x x x _ x x x x x x",
				"x x x x x x _ x x x x x x",
				"x x x x x x _ x x x x x x",
				"_ _ _ x x x _ x x x _ _ _",
			},
		},
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		keys = {
			{
				"<leader>up",
				function() require("rainbow-delimiters").toggle(0) end,
				desc = "Toggle rainbow-delimiters",
			},
		},
		---@param opts rainbow_delimiters.config
		opts = function(_, opts)
			local js_query = "rainbow-parens"
			if opts.query == nil then opts.query = {} end
			for _, language in pairs(require("utils.constants").filetype.javascript) do
				opts.query[language] = js_query
			end
			opts.query.tsx = js_query
			return opts
		end,
	},
}
