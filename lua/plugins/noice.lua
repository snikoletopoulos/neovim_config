---@type LazySpec
return {
	"folke/noice.nvim",
	dependencies = { "folke/snacks.nvim" },
	opts = function()
		return {
			lsp = { progress = { enabled = true } },
			views = {
				cmdline_popup = {
					border = Snacks.util.is_transparent() and {} or {
						style = "none",
						padding = { 1, 2 },
					},
					filter_options = {},
					win_options = {
						winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
					},
				},
				popupmenu = {
					relative = "editor",
					position = {
						row = 27,
						col = "50%",
					},
					size = {
						width = 60,
						height = 10,
					},
					border = {
						style = "rounded",
						padding = { 0, 1 },
					},
				},
			},
			presets = {
				bottom_search = false,
				command_palette = false,
			},
		}
	end,
}
