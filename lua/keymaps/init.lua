---@type Keymaps
local maps = require("classes.Keymaps"):new()

require("keymaps.disable"):configure(maps, { astronvim = true, packages = true, tabline = true })
require("keymaps.editing"):configure(maps)
require("keymaps.ui"):configure(maps)

require("which-key").add({
	{ "<leader>h", group = "󱡅 Harpoon", mode = "n" },
	{ "<leader>c", group = " Log", mode = "n" },
})

return maps
