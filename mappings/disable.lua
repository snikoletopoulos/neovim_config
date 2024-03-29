---@alias KeymapsPackage "astronvim"|"packages"|"tabline"

---@class DisableKeymaps
---@field configure fun(self: DisableKeymaps, maps: Keymaps, options: table<KeymapsPackage, boolean>): nil
local DisableKeymaps = {
	astronvim = {
		{ mode = "n", lhs = "<leader>fa" },
		{ mode = "n", lhs = "<leader>fa" }, -- auto-save.nvim
		{ mode = "n", lhs = "<leader>uu" }, -- undotree.nvim
		{ mode = "n", lhs = "<leader>ft" }, -- todo-comments.nvim
		{ mode = "n", lhs = "<leader>uh" }, -- harpoon
		{ mode = "n", lhs = "<leader>e" }, -- CamelCaseMotion
		{ mode = "n", lhs = "<leader>w" }, -- CamelCaseMotion
		{ mode = "n", lhs = "<leader>ud" }, -- neo-tree-diagnostics.nvim
		{ mode = "n", lhs = "<leader>fm" }, -- find man
		{ mode = "n", lhs = "<leader>ua" }, -- toggle auto pairs
		{ mode = "n", lhs = "<leader>ub" }, -- toggle background
		{ mode = "n", lhs = "<leader>uy" }, -- toggle syntax highlighting
		{ mode = "n", lhs = "<leader>up" }, -- toggle paste mode
		{ mode = "n", lhs = "<leader>un" }, -- change line numbering
		{ mode = "n", lhs = "<leader>ug" }, -- toggle git signs column
		{ mode = "n", lhs = "<leader>uC" }, -- toggle color highlight
		{ mode = "n", lhs = "<leader>uc" }, -- toggle autocompletion
		{ mode = "n", lhs = "<leader>ui" }, -- change indent setting
		{ mode = "n", lhs = "<leader>ut" }, -- toggle tabline
		{ mode = "n", lhs = "<leader>ul" }, -- toggle statusline
		{ mode = "n", lhs = "<leader>uS" }, -- toggle conceal
		{ mode = "n", lhs = "<leader>C" }, -- force close buffer
		{ mode = "n", lhs = "<leader>c" }, -- swap with <leader>C
	},
	packages = {
		{ mode = "n", lhs = "<leader>pA" },
		{ mode = "n", lhs = "<leader>pa" },
		{ mode = "n", lhs = "<leader>pi" },
		{ mode = "n", lhs = "<leader>pl" },
		{ mode = "n", lhs = "<leader>pm" },
		{ mode = "n", lhs = "<leader>pM" },
		{ mode = "n", lhs = "<leader>ps" },
		{ mode = "n", lhs = "<leader>pS" },
		{ mode = "n", lhs = "<leader>pu" },
		{ mode = "n", lhs = "<leader>pU" },
		{ mode = "n", lhs = "<leader>pv" },
	},
	tabline = {
		{ mode = "n", lhs = "<leader>b" },
		{ mode = "n", lhs = "<leader>bb" },
		{ mode = "n", lhs = "<leader>bd" },
		{ mode = "n", lhs = "<leader>b\\" },
		{ mode = "n", lhs = "<leader>b|" },
		{ mode = "n", lhs = "<leader>bl" },
		{ mode = "n", lhs = "<leader>br" },
		{ mode = "n", lhs = "<leader>bse" },
		{ mode = "n", lhs = "<leader>bsi" },
		{ mode = "n", lhs = "<leader>bsm" },
		{ mode = "n", lhs = "<leader>bsp" },
		{ mode = "n", lhs = "<leader>bsr" },
	},
}

function DisableKeymaps:configure(maps, options)
	if options.astronvim then
		for _, keymap in ipairs(self.astronvim) do
			maps:add(keymap.mode, keymap.lhs, false)
		end
	end

	if options.packages then
		for _, keymap in ipairs(self.packages) do
			maps:add(keymap.mode, keymap.lhs, false)
		end
	end

	if options.tabline then
		for _, keymap in ipairs(self.tabline) do
			maps:add(keymap.mode, keymap.lhs, false)
		end
	end
end

return DisableKeymaps
