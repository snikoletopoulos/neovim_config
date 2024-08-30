---@type LazySpec
return {
	{
		"brenoprata10/nvim-highlight-colors",
		opts = { enable_tailwind = true, enabled_named_colors = true },
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
			for _, language in pairs(require("utils.constants").filetype.javascript) do
				if opts.logStatements == nil then opts.logStatements = { objectLog = {} } end
				opts.logStatements.objectLog[language] =
					'console.log("%s %s:", JSON.stringify(%s, null, 2));'
			end
			return opts
		end,
	},
}
