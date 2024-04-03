---@class NeovideKeymaps
---@field configure fun(self: NeovideKeymaps, maps: Keymaps): nil
local NeovideKeymaps = {}

function NeovideKeymaps:configure(maps)
	maps:add("n", "<F12>", {
		function()
			if vim.g.neovide_fullscreen == false then
				vim.g.neovide_fullscreen = true
			else
				vim.g.neovide_fullscreen = false
			end
		end,
		desc = "Toggle fullscreen",
	})

	maps:add("n", "<F10>", {
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
	})

	maps:add("n", "<D-c>", { '"+y' }) -- Copy
	maps:add("n", "<D-v>", { '"+P' }) -- Paste normal mode
	maps:add("n", "<D-v>", { '"+P' }) -- Paste visual mode
	maps:add("n", "<D-v>", { "<C-R>+" }) -- Paste command mode
	maps:add("n", "<D-v>", { '<ESC>l"+Pli' }) -- Paste insert mode
end

return NeovideKeymaps
