local M = {}

function M.astronvim(maps)
	maps.n["<leader>fa"] = false -- auto-save.nvim
	maps.n["<leader>uu"] = false -- undotree.nvim
	maps.n["<leader>ft"] = false -- todo-comments.nvim
	maps.n["<leader>uh"] = false -- harpoon
	maps.n["<leader>e"] = false -- CamelCaseMotion
	maps.n["<leader>w"] = false -- CamelCaseMotion
	maps.n["<leader>ud"] = false -- neo-tree-diagnostics.nvim
	maps.n["<leader>fm"] = false -- find man
	maps.n["<leader>ua"] = false -- toggle auto pairs
	maps.n["<leader>ub"] = false -- toggle background
	maps.n["<leader>uy"] = false -- toggle syntax highlighting
	maps.n["<leader>up"] = false -- toggle paste mode
	maps.n["<leader>un"] = false -- change line numbering
	maps.n["<leader>ug"] = false -- toggle git signs column
	maps.n["<leader>uC"] = false -- toggle color highlight
	maps.n["<leader>uc"] = false -- toggle autocompletion
	maps.n["<leader>ui"] = false -- change indent setting
	maps.n["<leader>ut"] = false -- toggle tabline
	maps.n["<leader>ul"] = false -- toggle statusline
	maps.n["<leader>uS"] = false -- toggle conceal

	return maps
end

function M.packages(maps)
	maps.n["<leader>pA"] = false
	maps.n["<leader>pa"] = false
	maps.n["<leader>pi"] = false
	maps.n["<leader>pl"] = false
	maps.n["<leader>pm"] = false
	maps.n["<leader>pM"] = false
	maps.n["<leader>ps"] = false
	maps.n["<leader>pS"] = false
	maps.n["<leader>pu"] = false
	maps.n["<leader>pU"] = false
	maps.n["<leader>pv"] = false

	return maps
end

function M.tabline(maps)
	maps.n["<leader>b"] = false
	maps.n["<leader>bb"] = false
	maps.n["<leader>bd"] = false
	maps.n["<leader>b\\"] = false
	maps.n["<leader>b|"] = false
	maps.n["<leader>bl"] = false
	maps.n["<leader>br"] = false
	maps.n["<leader>bse"] = false
	maps.n["<leader>bsi"] = false
	maps.n["<leader>bsm"] = false
	maps.n["<leader>bsp"] = false
	maps.n["<leader>bsr"] = false

	return maps
end

function M.trouble(maps)
	maps.n["<leader>xX"] = false
	maps.n["<leader>xx"] = false
	maps.n["<leader>xl"] = false
	maps.n["<leader>xq"] = false

	return maps
end

return M
