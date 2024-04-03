-- TODO: configure neorg
if true then return {} end

---@type LazySpec
return {
	"nvim-neorg/neorg",
	dependencies = { "nvim-lua/plenary.nvim" },
	build = ":Neorg sync-parsers",
	ft = "norg",
	opts = {
		load = {
			["core.defaults"] = {},
			["core.concealer"] = {
				config = { icon_preset = "diamond" },
			},
			["core.dirman"] = {
				config = {
					workspaces = {
						notes = "~/notes",
						current_dir = ".",
					},
					default_workspace = "notes",
				},
			},
			["core.completion"] = {
				config = {
					engine = "nvim-cmp",
				},
			},
			["core.integrations.nvim-cmp"] = {},
		},
	},
}
