-- NOTE: Vim plugin
---@type LazySpec
return {
	{
		"bkad/CamelCaseMotion",
		lazy = false,
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
}
