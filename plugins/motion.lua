return {
	-- NOTE: Vim plugin
	{
		"bkad/CamelCaseMotion",
		lazy = false, -- TODO: remove this when keymaps are fixed
		keys = {
			{
				"<leader>w",
				"<Plug>CamelCaseMotion_w",
				desc = "Next camel case word",
				mode = { "n", "v" },
			},
			{
				"<leader>e",
				"<Plug>CamelCaseMotion_e",
				desc = "Next end of camel case word",
				mode = { "n", "v" },
			},
			{
				"<leader>b",
				"<Plug>CamelCaseMotion_b",
				desc = "Next start of camel case word",
				mode = { "n", "v" },
			},
			{
				"<leader>ge",
				"<Plug>CamelCaseMotion_ge",
				desc = "Previous end of camel case word",
				mode = { "n", "v" },
			},
		},
	},
	-- NOTE: Vim plugin
	{ "wellle/targets.vim", lazy = false },
}
