local function index_of(array, value)
	for i, v in ipairs(array) do
		if v == value then
			return i
		end
	end
	return nil
end

local function remove_list_value(list, value)
	local index = index_of(list, value)
	if index then
		return table.remove(list, index)
	end
	return nil
end

return {
	index_of = index_of,
	remove_list_value = remove_list_value,
}
