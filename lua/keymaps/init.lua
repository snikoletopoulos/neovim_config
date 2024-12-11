---@type Keymaps
local maps = require("classes.Keymaps"):new()

require("keymaps.disable"):configure(maps, { astronvim = true, packages = true, tabline = true })
require("keymaps.editing"):configure(maps)

require("which-key").add({
	{ "<leader>h", group = "󱡅 Harpoon", mode = "n" },
	{ "<leader>c", group = " Log / 󰭹 Copilot Chat", mode = "n" },
	{ "<leader>c", group = "󰭹 Copilot Chat", mode = "v" },
	{ "<leader>cc", group = "󰭹 Copilot Chat", mode = { "n", "v" } },
})

return maps
