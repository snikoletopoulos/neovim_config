vim.filetype.add({
	extension = {
		conf = "conf",
		env = "dotenv",
		tiltfile = "tiltfile",
		Tiltfile = "tiltfile",
	},
	filename = {
		[".env"] = "dotenv",
		["tsconfig.json"] = "jsonc",
		[".eslintrc.json"] = "jsonc",
		[".yamlfmt"] = "yaml",
	},
	pattern = {
		["%.env%.[%w_.-]+"] = "dotenv",
	},
})
