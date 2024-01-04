return {
	{
		"chrisgrieser/nvim-spider",
		keys = {
			{ "w", enabled = false },
			{ "e", enabled = false },
			{ "b", enabled = false },
			{ "ge", enabled = false },
			{
				"<leader>w",
				"<cmd>lua require('spider').motion('w')<CR>",
				mode = { "n", "x", "o" },
				desc = "Next word",
			},
			{
				"<leader>e",
				"<cmd>lua require('spider').motion('e')<CR>",
				mode = { "n", "x", "o" },
				desc = "Next end of word",
			},
			{
				"<leader>b",
				"<cmd>lua require('spider').motion('b')<CR>",
				mode = { "n", "x", "o" },
				desc = "Previous word",
			},
			{
				"<leader>ge",
				"<cmd>lua require('spider').motion('ge')<CR>",
				mode = { "n", "x", "o" },
				desc = "Previous end of word",
			},
		},
	},
}
