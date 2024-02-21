local M = {}

function M.neovide(maps)
	if not vim.g.neovide then
		return maps
	end

	maps.n["<F12>"] = {
		function()
			if vim.g.neovide_fullscreen == false then
				vim.g.neovide_fullscreen = true
			else
				vim.g.neovide_fullscreen = false
			end
		end,
		desc = "Toggle fullscreen",
	}

	maps.n["<F10>"] = {
		function()
			if vim.g.neovide_transparency == 1.0 then
				vim.g.neovide_window_blurred = false
				vim.g.neovide_transparency = 0.8
			elseif vim.g.neovide_window_blurred == true then
				vim.g.neovide_transparency = 1.0
			else
				vim.g.neovide_window_blurred = true
			end
		end,
		desc = "Toggle transparency",
	}

	maps.v["<D-c>"] = { '"+y' } -- Copy
	maps.n["<D-v>"] = { '"+P' } -- Paste normal mode
	maps.v["<D-v>"] = { '"+P' } -- Paste visual mode
	maps.c["<D-v>"] = { "<C-R>+" } -- Paste command mode
	maps.i["<D-v>"] = { '<ESC>l"+Pli' } -- Paste insert mode

	return maps
end

return M
