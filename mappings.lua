local maps = { n = {}, i = {}, v = {}, x = {}, o = {}, c = {} }

-- Editing
maps.n.n = { "nzzzv", desc = "Next result" }
maps.n.N = { "Nzzzv", desc = "Previous result" }
maps.x["<leader>p"] = { '"_dP', desc = "Paste without coping" }
maps.n["<leader>y"] = { '"+y', desc = "Yank to clipboard" }
maps.x["<leader>y"] = { '"+y', desc = "Yank to clipboard" }
maps.n["<leader>Y"] = { '"+Y', desc = "Yank line to clipboard" }
maps.x["<leader>d"] = { '"_d', desc = "Cut" }
maps.n["<leader>d"] = { '"_d', desc = "Cut" }

-- Editor behavior
maps.n["<leader>c"] = {
	function()
		local bufs = vim.fn.getbufinfo({ buflisted = true })
		require("astronvim.utils.buffer").close(0)
		if
			require("astronvim.utils").is_available("alpha-nvim") and not bufs[2]
		then
			require("alpha").start(true)
		end
	end,
	desc = "Close buffer",
}

-- Naming
maps.n["<leader>h"] = { name = "󱡅 Harpoon", desc = "󱡅 Harpoon" }

-- Neovide
if vim.g.neovide then
	maps.n["<F12>"] = {
		function()
			if vim.g.neovide_fullscreen == false then
				vim.g.neovide_fullscreen = true
			else
				vim.g.neovide_fullscreen = false
			end
		end,
		desc = "Toggle fullscreen",
	}

	maps.n["<F10>"] = {
		function()
			if vim.g.neovide_transparency == 1.0 then
				vim.g.neovide_window_blurred = false
				vim.g.neovide_transparency = 0.8
			elseif vim.g.neovide_window_blurred == true then
				vim.g.neovide_transparency = 1.0
			else
				vim.g.neovide_window_blurred = true
			end
		end,
		desc = "Toggle transparency",
	}

	maps.v["<D-c>"] = { '"+y' } -- Copy
	maps.n["<D-v>"] = { '"+P' } -- Paste normal mode
	maps.v["<D-v>"] = { '"+P' } -- Paste visual mode
	maps.c["<D-v>"] = { "<C-R>+" } -- Paste command mode
	maps.i["<D-v>"] = { '<ESC>l"+Pli' } -- Paste insert mode
end

-- Disable AstroNvim mappings
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
maps.n["<leader>uY"] = false -- toggle LSP semantic highlighting TODO: not working
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

-- Packages
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
--

-- Disable Tabline mappings
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
