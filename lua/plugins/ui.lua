---@type LazySpec
return {
	{
		"akinsho/toggleterm.nvim",
		opts = { winbar = { enabled = false } },
	},
	{
		"mbbill/undotree",
		keys = {
			{
				"<leader>uu",
				"<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>",
				desc = "Toggle undotree",
			},
		},
		init = function() vim.g.undotree_WindowLayout = 2 end,
	},
	{
		"nvim-telescope/telescope.nvim",
		opts = function(_, opts)
			local actions = require("telescope.actions")

			return require("astrocore").extend_tbl(opts, {
				pickers = {
					buffers = {
						mappings = {
							i = {
								["<c-d>"] = actions.delete_buffer + actions.move_to_top,
							},
						},
					},
				},
				extensions = {
					undo = {
						use_delta = false,
						mappings = {
							i = {
								["<cr>"] = require("telescope-undo.actions").restore,
								["<S-cr>"] = false,
								["<C-cr>"] = false,
								-- alternative defaults, for users whose terminals do questionable things with modified <cr>
								["<C-y>"] = require("telescope-undo.actions").yank_additions,
								["<C-r>"] = require("telescope-undo.actions").yank_deletions,
								["<C-g>"] = require("telescope-undo.actions").restore,
							},
							n = {
								["y"] = require("telescope-undo.actions").yank_additions,
								["r"] = require("telescope-undo.actions").yank_deletions,
								["d"] = require("telescope-undo.actions").restore,
							},
						},
					},
				},
			})
		end,
	},
	{
		"FabijanZulj/blame.nvim",
		opts = { date_format = "%d/%m/%Y" },
	},
	{
		"sindrets/diffview.nvim",
		opts = { view = { merge_tool = { layout = "diff4_mixed" } } },
	},
	{
		"kevinhwang91/nvim-bqf",
		opts = function(_, opts)
			if not opts.preview then opts.preview = {} end
			if Snacks.util.is_transparent() then opts.preview.winblend = 0 end
			return opts
		end,
	},
	{ "rcarriga/nvim-notify", enabled = false },
	{ "goolord/alpha-nvim", enabled = false },
}
