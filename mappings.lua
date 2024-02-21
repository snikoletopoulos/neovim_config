local maps = { n = {}, i = {}, v = {}, x = {}, o = {}, c = {} }

maps = astronvim.user_opts("mappings.debugging").debugging(maps)

maps = astronvim.user_opts("mappings.disable").astronvim(maps)
maps = astronvim.user_opts("mappings.disable").tabline(maps)
maps = astronvim.user_opts("mappings.disable").trouble(maps)
maps = astronvim.user_opts("mappings.disable").packages(maps)

maps = astronvim.user_opts("mappings.editing").editing(maps)

maps = astronvim.user_opts("mappings.neovide").neovide(maps)

-- Naming
maps.n["<leader>h"] = { name = "󱡅 Harpoon", desc = "󱡅 Harpoon" }

return maps
