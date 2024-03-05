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
		[".yamlfmt"] = "yaml",
	},
	pattern = {
		["%.env%.[%w_.-]+"] = "dotenv",
	},
})

return {
	options = {
		g = {
			camelcasemotion_key = "<leader>",
			loaded_perl_provider = 0,
			maplocalleader = ",",

			-- Neovide
			neovide_cursor_animation_length = 0,
			neovide_input_macos_alt_is_meta = true,
			remember_window_size = true,
			remember_window_position = true,
		},
		opt = {
			clipboard = "",
			swapfile = false,
			foldmethod = "expr",
			foldexpr = "nvim_treesitter#foldexpr()",
			foldlevel = 99,
			showtabline = 0,
			conceallevel = 2,
			scrolloff = 5,

			-- Neovide
			guifont = "FiraCode Nerd Font",
			linespace = 6,
		},
	},
}
