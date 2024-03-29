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
maps:add(
	"n",
	"<leader>c",
	{ name = " Log / 󰭹 Copilot Chat", desc = " Log / 󰭹 Copilot Chat" }
)
maps:add("v", "<leader>c", { name = "󰭹 Copilot Chat", desc = "󰭹 Copilot Chat" })
maps:add({ "n", "v" }, "<leader>cc", { name = "󰭹 Copilot Chat", desc = "󰭹 Copilot Chat" })

return maps:create()
