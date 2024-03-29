---@type Keymaps
local maps = astronvim.user_opts("classes.Keymaps"):new()

maps:add("n", "<leader>uY", false)
maps:add("v", "<leader>uY", false)

return maps:create()
