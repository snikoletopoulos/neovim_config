---@type LazySpec
return {
	{
		"okuuva/auto-save.nvim",
		cmd = { "ASToggle" },
		event = { "User AstroFile", "InsertLeave", "TextChanged" },
		keys = {
			{ "<leader>fa", "ASToggle", desc = "Toggle auto-save" },
		},
		opts = {
			execution_message = { enabled = false },
			condition = function(buffer)
				return require("auto-save.utils.data").not_in(
					vim.fn.getbufvar(buffer, "&filetype"),
					{ "harpoon" }
				)
			end,
		},
	},
	{
		"smoka7/multicursors.nvim",
		keys = {
			{
				"<M-n>",
				"<cmd>MCstart<cr>",
				desc = "Create a selection for selected text or word under the cursor",
				mode = { "v", "n" },
			},
		},
	},
}
