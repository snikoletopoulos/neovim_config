---@type LazySpec
return {
	{
		"zbirenbaum/copilot.lua",
		opts = {
			filetypes = { yaml = true, markdown = true },
			suggestion = { enabled = false },
			panel = { enabled = false },
			server_opts_overrides = {
				settings = { telemetry = { telemetryLevel = "off" } },
			},
		},
	},
	-- {
	-- 	"supermaven-inc/supermaven-nvim",
	-- 	opts = {
	-- 		keymaps = {
	-- 			clear_suggestion = "<M-r>",
	-- 		},
	-- 	},
	-- 	specs = {
	-- 		{
	-- 			"AstroNvim/astrocore",
	-- 			opts = {
	-- 				options = {
	-- 					g = {
	-- 						-- set the ai_accept function
	-- 						ai_accept = function()
	-- 							local suggestion = require("supermaven-nvim.completion_preview")
	-- 							if suggestion.has_suggestion() then
	-- 								vim.schedule(function() suggestion.on_accept_suggestion() end)
	-- 								return true
	-- 							end
	-- 						end,
	-- 					},
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- },
}
