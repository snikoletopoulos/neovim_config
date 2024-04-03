---@class Helpers
---@field index_of fun(self: Helpers, array: table, value: any): number|nil
---@field remove_list_value fun(self: Helpers, list: table, value: any): any|nil
---@field check_json_key_exists fun(self: Helpers, filename: string, key: string): boolean
local Helpers = {}

function Helpers:index_of(array, value)
	for i, v in ipairs(array) do
		if v == value then return i end
	end
	return nil
end

function Helpers:remove_list_value(list, value)
	local index = self:index_of(list, value)
	if index then return table.remove(list, index) end
	return nil
end

function Helpers:check_json_key_exists(filename, key)
	local file = io.open(filename, "r")
	if not file then return false end

	local content = file:read("*all")
	file:close()

	local json_parsed, json = pcall(vim.fn.json_decode, content)
	if not json_parsed or type(json) ~= "table" then return false end

	return json[key] ~= nil
end

return Helpers
