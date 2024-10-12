---@type LazySpec
return {
	{
		"brenoprata10/nvim-highlight-colors",
		opts = { enable_tailwind = true, enabled_named_colors = true },
	},
	{
		"chrisgrieser/nvim-chainsaw",
		keys = {
			{ "<leader>cv", function() require("chainsaw").variableLog() end, desc = "Log variable" },
			{ "<leader>co", function() require("chainsaw").objectLog() end, desc = "Log object" },
			{ "<leader>cm", function() require('chainsaw').messageLog()end, desc = "Log" },
			{ "<leader>cb", function() require('chainsaw').emojiLog()end, desc = "Log beep" },
			{ "<leader>cr", function() require('chainsaw').removeLogs()end, desc = "Clear logs" },
		},
		opts = function(_, opts)
			for _, language in pairs(require("utils.constants").filetype.javascript) do
				if opts.logStatements == nil then opts.logStatements = { objectLog = {} } end
				opts.logStatements.objectLog[language] =
					'console.log("%s %s:", JSON.stringify(%s, null, 2));'
			end
			return opts
		end,
	},
}
