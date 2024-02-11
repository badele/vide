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

-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = "*",
-- 	callback = function(args)
-- 		require("conform").format({ lsp_fallback = true, bufnr = args.buf })
-- 	end,
-- })
--
--vim.api.nvim_create_autocmd("LspAttach", {
--	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
--	callback = require("core.lsp_on_attach"),
--})

-- vim.api.nvim_create_autocmd("InsertEnter", {
-- 	callback = function()
-- 		vim.api.nvim_set_hl(0, "Normal", { bg = "#202232" })
-- 	end
-- })
--
-- vim.api.nvim_create_autocmd("InsertLeave", {
-- 	callback = function()
-- 		vim.api.nvim_set_hl(0, "Normal", { bg = "#222436" })
-- 	end
-- })
