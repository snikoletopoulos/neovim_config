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
		dir = "/Applications/Ghostty.app/Contents/Resources/vim/vimfiles/",
		lazy = false,
	},
}
