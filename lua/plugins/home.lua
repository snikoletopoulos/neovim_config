---@type LazySpec
return {
	"goolord/alpha-nvim",
	keys = {
		{
			"<leader>ua",
			function() require("alpha").start() end,
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

		opts.section.buttons.val = {
			opts.button("LDR n  ", require("astroui").get_icon("FileNew", 2, true) .. "New File  "),
			opts.button(
				"LDR f o",
				require("astroui").get_icon("DefaultFile", 2, true) .. "Recent files "
			),
			opts.button("LDR f p", require("astroui").get_icon("Bookmarks", 2, true) .. "Projects  "),
			opts.button("LDR S l", require("astroui").get_icon("Refresh", 2, true) .. "Last Session  "),
		}
		return opts
	end,
}
