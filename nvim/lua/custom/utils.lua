local M = {}

local function has_value(tab, val)
	for _, value in ipairs(tab) do
		if value == val then
			return true
		end
	end

	return false
end

M.open_man = function()
	local types = vim.treesitter.get_captures_at_cursor()

	if not has_value(types, 'function.call') then
		return
	end

	local cword = vim.fn.expand('<cword>')
	local ok, _ = pcall(function()
		vim.cmd("Man " .. cword)
	end)

	if not ok then
		print("No manual entry for " .. cword)
	end
end

return M
