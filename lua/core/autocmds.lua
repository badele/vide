-- Restore last cusor position when file is re-opened
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local last_pos = vim.fn.line("'\"")
		if last_pos > 0 and last_pos <= vim.fn.line("$") then
			vim.api.nvim_win_set_cursor(0, { last_pos, 0 })
		end
	end,
})

-- highlight the yank event
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})
