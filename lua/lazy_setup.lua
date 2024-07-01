require("lazy").setup({
	{
		"AstroNvim/AstroNvim",
		version = "^4", -- Remove version tracking to elect for nightly AstroNvim
		import = "astronvim.plugins",
		opts = { -- AstroNvim options must be set here with the `import` key
			mapleader = " ", -- This ensures the leader key must be configured before Lazy is set up
			maplocalleader = ",", -- This ensures the localleader key must be configured before Lazy is set up spell-checker:disable-line
			icons_enabled = true, -- Set to false to disable icons (if no Nerd Font is available)
			pin_plugins = nil, -- Default will pin plugins when tracking `version` of AstroNvim, set to true/false to override
		},
	},
	{ import = "community" },
	{ import = "plugins" },
} --[[@as LazySpec]], {
	install = { colorscheme = { require("colorscheme"), "astrodark", "habamax" } }, -- spell-checker:disable-line
	ui = { backdrop = 40 },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"netrwPlugin", -- spell-checker:disable-line
				"tarPlugin",
				"tohtml", -- spell-checker:disable-line
				"zipPlugin",
			},
		},
	},
} --[[@as LazyConfig]])
