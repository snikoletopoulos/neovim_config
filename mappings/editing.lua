---@class EditingKeymaps
---@field configure fun(self: EditingKeymaps, maps: Keymaps): nil
local EditingKeymaps = {}

---@param maps Keymaps
function EditingKeymaps:configure(maps)
	maps:add("n", "n", { "nzzzv", desc = "Next result" })
	maps:add("x", "<leader>p", { '"_dP', desc = "Paste without coping" })
	maps:add("n", "<leader>y", { '"+y', desc = "Yank to clipboard" })
	maps:add("x", "<leader>y", { '"+y', desc = "Yank to clipboard" })
	maps:add("x", "<leader>D", { '"_d', desc = "Cut" })
	maps:add("n", "<leader>D", { '"_d', desc = "Cut" })
	maps:add("n", "<leader>C", {
		function()
			require("astronvim.utils.buffer").close()
		end,
		desc = "Close buffer",
	})

	maps:add("n", "<leader>c", {
		function()
			local bufs = vim.fn.getbufinfo({ buflisted = true })
			require("astronvim.utils.buffer").close(0)
			if require("astronvim.utils").is_available("alpha-nvim") and not bufs[2] then
				require("alpha").start(true)
			end
		end,
		desc = "Close buffer",
	})
end

return EditingKeymaps
