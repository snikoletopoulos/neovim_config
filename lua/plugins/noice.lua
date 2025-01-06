---@type LazySpec
return {
	"folke/noice.nvim",
	dependencies = { "folke/snacks.nvim" },
	opts = function()
		return {
			views = {
				cmdline_popup = {
					border = Snacks.util.is_transparent() and {} or {
						style = "none",
						padding = { 1, 2 },
					},
				},
			},
			presets = {
				bottom_search = false,
				command_palette = true,
			},
		}
	end,
}
