---@type LazySpec
return {
	"folke/noice.nvim",
	opts = {
		routes = {
			{
				filter = {
					event = "notify",
					find = "No information available",
				},
				opts = { skip = true },
			},
		},
		lsp = { progress = { enabled = true } },
		views = {
			cmdline_popup = {
				border = {
					style = "none",
					padding = { 1, 2 },
				},
				filter_options = {},
				win_options = {
					winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
				},
			},
		},
		presets = { bottom_search = false },
	},
}
