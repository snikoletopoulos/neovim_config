---@class UiKeymaps
---@field configure fun(self: UiKeymaps, maps: Keymaps): nil
local UiKeymaps = {}

function UiKeymaps:configure(maps)
	maps:add("n", "gr", {
		function() Snacks.picker.lsp_references() end,
		desc = "Go to reference",
	})
	maps:add("n", "<Leader>tt", {
		function() require("astrocore").toggle_term_cmd({ cmd = "btop ", direction = "float" }) end,
		desc = "ToggleTerm btop",
	})
	maps:add("n", "<Leader>P", { function() Command_palette() end, desc = "Command Palette" })
end

return UiKeymaps
