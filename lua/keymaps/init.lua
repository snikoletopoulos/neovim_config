---@type Keymaps
local maps = require("classes.Keymaps"):new()

require("keymaps.disable"):configure(maps, { astronvim = true, packages = true, tabline = true })
require("keymaps.editing"):configure(maps)
if not vim.g.neovide then require("keymaps.neovide"):configure(maps) end

maps:add("n", "<Leader>h", { desc = "󱡅 Harpoon" })
maps:add("n", "<Leader>c", { desc = " Log / 󰭹 Copilot Chat" })
maps:add("v", "<Leader>c", { desc = "󰭹 Copilot Chat" })
maps:add({ "n", "v" }, "<Leader>cc", { desc = "󰭹 Copilot Chat" })

return maps
