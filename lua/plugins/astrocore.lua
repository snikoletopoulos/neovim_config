---@type LazySpec
return {
	"AstroNvim/astrocore",
	---@type AstroCoreOpts
	opts = {
		features = {
			large_buf = { size = 1024 * 500, lines = 10000 },
			autopairs = true,
			cmp = true,
			diagnostics_mode = 3,
			highlighturl = true,
			notifications = true,
		},
		diagnostics = {
			severity_sort = true,
		},
		options = {
			opt = {
				clipboard = "",
				scrolloff = 5,
				showtabline = 0,
				swapfile = false,
				foldmethod = "expr",
				foldexpr = "nvim_treesitter#foldexpr()",
				foldlevel = 99,
				conceallevel = 2,

			},
			g = {
				loaded_perl_provider = 0,
			},
		},
		mappings = require("keymaps"):create(),
		filetypes = {
			extension = {
				env = "dotenv",
			},
			filename = {
				[".env"] = "dotenv",
				["tsconfig.json"] = "jsonc",
				[".eslintrc.json"] = "jsonc",
				[".yamlfmt"] = "yaml",
				[".sqlfluff"] = "toml",
			},
			pattern = {
				["%.env%.[%w_.-]+"] = "dotenv",
			},
		},
		rooter = { notify = true },
	},
}
