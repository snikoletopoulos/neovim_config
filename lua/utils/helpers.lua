---@class Helpers
---@field index_of fun(self: Helpers, array: table, value: any): number|nil
---@field remove_list_value fun(self: Helpers, list: table, value: any): any|nil
---@field check_json_key_exists fun(self: Helpers, filename: string, key: string): boolean
---@field get_highlight fun(self: Helpers, name: string): { foreground: string?, background: string?, special: string?}?
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

function Helpers:get_highlight(name)
	local ok, hl = pcall(vim.api.nvim_get_hl, name, true)
	if not ok then return end
	for _, key in pairs({ "foreground", "background", "special" }) do
		if hl[key] then hl[key] = string.format("#%06x", hl[key]) end
	end
	return hl
end

return Helpers
