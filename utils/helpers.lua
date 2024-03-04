---@class Helpers
---@field index_of fun(self: Helpers, array: table, value: any): number|nil
---@field remove_list_value fun(self: Helpers, list: table, value: any): any|nil
local Helpers = {}

function Helpers:index_of(array, value)
	for i, v in ipairs(array) do
		if v == value then
			return i
		end
	end
	return nil
end

function Helpers:remove_list_value(list, value)
	local index = Helpers.index_of(list, value)
	if index then
		return table.remove(list, index)
	end
	return nil
end

return Helpers
