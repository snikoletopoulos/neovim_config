---@type Keymaps
local maps = astronvim.user_opts("classes.Keymaps"):new()

astronvim
	.user_opts("mappings.disable")
	:configure(maps, { astronvim = true, packages = true, tabline = true })
astronvim.user_opts("mappings.editing"):configure(maps)
if not vim.g.neovide then
	astronvim.user_opts("mappings.neovide"):configure(maps)
end

maps:add("n", "<leader>h", { name = "󱡅 Harpoon", desc = "󱡅 Harpoon" })
maps:add("n", "<leader>c", { name = " Log", desc = " Log" })

return maps:create()
