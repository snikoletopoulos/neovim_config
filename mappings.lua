---@type Keymaps
local maps = astronvim.user_opts("classes.Keymaps"):new()

maps:add("n", "<leader>h", { name = "󱡅 Harpoon", desc = "󱡅 Harpoon" })

astronvim
	.user_opts("mappings.disable")
	:configure(maps, { astronvim = true, packages = true, tabline = true, trouble = true })
astronvim.user_opts("mappings.editing"):configure(maps)
if not vim.g.neovide then
	astronvim.user_opts("mappings.neovide"):configure(maps)
end

return maps:create()
