---@class EditingKeymaps
---@field configure fun(self: EditingKeymaps, maps: Keymaps): nil
local EditingKeymaps = {}

function EditingKeymaps:configure(maps)
	maps:add("n", "n", { "nzzzv", desc = "Next result" })
	maps:add("n", "N", { "Nzzzv", desc = "Next result" })
	maps:add("x", "<Leader>p", { '"_dP', desc = "Paste without coping" })
	maps:add("n", "<Leader>y", { '"+y', desc = "Yank to clipboard" })
	maps:add("x", "<Leader>y", { '"+y', desc = "Yank to clipboard" })
	maps:add("n", "<Leader>Y", { '"+Y', desc = "Yank rest of line to clipboard" })
	maps:add("x", "<Leader>Y", { '"+Y', desc = "Yank rest of line to clipboard" })
	maps:add("x", "<Leader>D", { '"_d', desc = "Cut" })
	maps:add("n", "<Leader>D", { '"_d', desc = "Cut" })
	maps:add("n", "<leader>C", {
		function()
			local bufs = vim.fn.getbufinfo({ buflisted = true })
			require("astrocore.buffer").close(0)
			if require("astrocore").is_available("alpha-nvim") and not bufs[2] then
				require("alpha").start(true)
			end
		end,
		desc = "Close buffer",
	})
end

return EditingKeymaps
