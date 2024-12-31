---@type LazySpec
return {
	{
		"okuuva/auto-save.nvim",
		cmd = { "ASToggle" },
		event = { "User AstroFile", "InsertEnter" },
		keys = {
			{ "<leader>fa", "<cmd>ASToggle<cr>", desc = "Toggle auto-save" },
		},
		opts = {
			condition = function(buffer)
				local filetype = vim.fn.getbufvar(buffer, "&filetype")
				if vim.list_contains({ "harpoon" }, filetype) then return false end
				return true
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
	{
		"chrisgrieser/nvim-spider",
		keys = {
			{
				"<leader>w",
				"<cmd>lua require('spider').motion('w')<CR>",
				mode = { "n", "o", "x" },
				desc = "Next camel case word",
			},
			{
				"<leader>e",
				"<cmd>lua require('spider').motion('e')<CR>",
				mode = { "n", "o", "x" },
				desc = "Next end of camel case word",
			},
			{
				"<leader>b",
				"<cmd>lua require('spider').motion('b')<CR>",
				mode = { "n", "o", "x" },
				desc = "Next start of camel case word",
			},
			{
				"<leader>ge",
				"<cmd>lua require('spider').motion('ge')<CR>",
				mode = { "n", "o", "x" },
				desc = "Previous end of camel case word",
			},
		},
	},
	{
		"chrisgrieser/nvim-various-textobjs",
		opts = { useDefaultKeymaps = false },
		keys = {
			{
				"a<leader>w",
				'<cmd>lua require("various-textobjs").subword("outer")<CR>',
				mode = { "o", "x" },
			},
			{
				"i<leader>w",
				'<cmd>lua require("various-textobjs").subword("inner")<CR>',
				mode = { "o", "x" },
			},
		},
	},
	{
		"chipsenkbeil/distant.nvim",
		branch = "v0.3",
		config = function() require("distant"):setup({}) end,
	},
	{
		"lewis6991/hover.nvim",
		opts = {
			init = function()
				require("hover.providers.lsp")
				require("hover.providers.gh_user")
				require("hover.providers.dap")
				require("hover.providers.diagnostic")
				require("hover.providers.man")
			end,
		},
	},
}
