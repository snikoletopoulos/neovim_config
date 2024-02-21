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
			local button, get_icon =
				require("astronvim.utils").alpha_button, require("astronvim.utils").get_icon

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

			opts.section.buttons.val = {
				button("LDR n  ", get_icon("FileNew", 2, true) .. "New File  "),
				button("LDR f o", get_icon("DefaultFile", 2, true) .. "Recent files "),
				button("LDR f p", get_icon("Bookmarks", 2, true) .. "Projects  "),
				button("LDR S l", get_icon("Refresh", 2, true) .. "Last Session  "),
			}
			return opts
		end,
	},
}
