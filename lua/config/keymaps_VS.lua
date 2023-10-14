local function map(mode, lhs, rhs, opts)
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Visual Studio keys mapping
-- map({ "i", "v", "n", "s" }, "<C-n>", "<cmd>tabnew<cr><esc>", { desc = "New file (VS)" })
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>silent w<cr><esc>", { desc = "Save file (VS)" })
map({ "i", "v", "n", "s" }, "<C-p>", "<cmd>Telescope oldfiles<cr>", { desc = "Recently opened files (VS)" })
