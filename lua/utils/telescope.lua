---@class TelescopeUtils
---@field get_highlight fun(self: TelescopeUtils): table
local TelescopeUtils = {}

function TelescopeUtils:get_highlight()
	local get_hlgroup = require("astroui").get_hlgroup

	local normal = get_hlgroup("Normal")
	local fg, bg = normal.fg, normal.bg
	local bg_alt = get_hlgroup("Visual").bg
	local green = get_hlgroup("String").fg
	local red = get_hlgroup("Error").fg

	return {
		TelescopeBorder = { fg = bg_alt, bg = bg },
		TelescopeNormal = { bg = bg },
		TelescopePreviewBorder = { fg = bg, bg = bg },
		TelescopePreviewNormal = { bg = bg },
		TelescopePreviewTitle = { fg = bg, bg = green },
		TelescopePromptBorder = { fg = bg_alt, bg = bg_alt },
		TelescopePromptNormal = { fg = fg, bg = bg_alt },
		TelescopePromptPrefix = { fg = red, bg = bg_alt },
		TelescopePromptTitle = { fg = bg, bg = red },
		TelescopeResultsBorder = { fg = bg, bg = bg },
		TelescopeResultsNormal = { bg = bg },
		TelescopeResultsTitle = { fg = bg, bg = bg },
	}
end

return TelescopeUtils
