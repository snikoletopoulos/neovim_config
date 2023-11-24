return {
	{
		"goolord/alpha-nvim",
		keys = {
			{
				"<leader>ua",
				function()
					require("alpha").start()
				end,
				desc = "Toggle home screen",
			},
		},
		opts = function(_, opts)
			opts.section.header.val = {
				"███    ██ ██ ██  ██ ██████ ██████   ██████",
				"████   ██ ██ ██ ██  ██     ██   ██ ██    ██",
				"██ ██  ██ ██ ████   ████   ██████  ██    ██",
				"██  ██ ██ ██ ██ ██  ██     ██   ██ ██    ██",
				"██   ████ ██ ██  ██ ██████ ██   ██  ██████",
				" ",
				"     ███    ██ ██    ██ ██ ███    ███",
				"     ████   ██ ██    ██ ██ ████  ████",
				"     ██ ██  ██ ██    ██ ██ ██ ████ ██",
				"     ██  ██ ██  ██  ██  ██ ██  ██  ██",
				"     ██   ████   ████   ██ ██      ██",
			}
			return opts
		end,
	},
}
