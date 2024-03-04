local M = {}

function M.editing(maps)
	maps.n.n = { "nzzzv", desc = "Next result" }
	maps.n.N = { "Nzzzv", desc = "Previous result" }
	maps.x["<leader>p"] = { '"_dP', desc = "Paste without coping" }
	maps.n["<leader>y"] = { '"+y', desc = "Yank to clipboard" }
	maps.x["<leader>y"] = { '"+y', desc = "Yank to clipboard" }
	maps.x["<leader>D"] = { '"_d', desc = "Cut" }
	maps.n["<leader>D"] = { '"_d', desc = "Cut" }

	maps.n["<leader>c"] = {
		function()
			local bufs = vim.fn.getbufinfo({ buflisted = true })
			require("astronvim.utils.buffer").close(0)
			if require("astronvim.utils").is_available("alpha-nvim") and not bufs[2] then
				require("alpha").start(true)
			end
		end,
		desc = "Close buffer",
	}

	return maps
end

return M
