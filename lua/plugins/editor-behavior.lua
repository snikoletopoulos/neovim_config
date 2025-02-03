---@type LazySpec
return {
	{
		"okuuva/auto-save.nvim",
		cmd = { "ASToggle" },
		event = { "User AstroFile", "InsertEnter" },
		keys = {
			{ "<leader>fa", ":ASToggle<CR>", desc = "Toggle auto-save" },
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
				":MCstart<CR>",
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
				function() require("spider").motion("w") end,
				mode = { "n", "o", "x" },
				desc = "Next camel case word",
			},
			{
				"<leader>e",
				function() require("spider").motion("e") end,
				mode = { "n", "o", "x" },
				desc = "Next end of camel case word",
			},
			{
				"<leader>b",
				function() require("spider").motion("b") end,
				mode = { "n", "o", "x" },
				desc = "Next start of camel case word",
			},
			{
				"<leader>ge",
				function() require("spider").motion("ge") end,
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
				function() require("various-textobjs").subword("outer") end,
				mode = { "o", "x" },
			},
			{
				"i<leader>w",
				function() require("various-textobjs").subword("inner") end,
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
