local M = {}

-- keymap helper
function M.map(modes, keys, func, desc, opts)
	opts = opts or {}
	opts.desc = desc
	vim.keymap.set(modes, keys, func, opts)
end

return M
