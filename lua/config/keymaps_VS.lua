local function map(mode, lhs, rhs, opts)
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Visual Studio keys mapping
map({ "i", "v", "n", "s" }, "<C-n>", "<cmd>tabnew<cr><esc>", { desc = "New file (VS)" })
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>silent w<cr><esc>", { desc = "Save file (VS)" })
map({ "i", "v", "n", "s" }, "<C-p>", "<cmd>Telescope oldfiles<cr>", { desc = "Recently opened files (VS)" })

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- shift+arrow selection
map({ "n", "i" }, "<F8>", vim.diagnostic.goto_next, { desc = "Go to next problem" })

-- shift+arrow selection
map({ "n" }, "<S-Up>", "V", { desc = "Arrow Up selection" })
map({ "n" }, "<S-Down>", "V", { desc = "Arrow Down selection" })
map({ "i" }, "<S-Up>", "<ESC>V", { desc = "Arrow Up selection" })
map({ "i" }, "<S-Down>", "<ESC>V", { desc = "Arrow Down selection" })
map({ "v" }, "<S-Up>", "k", { desc = "Arrow Up selection" })
map({ "v" }, "<S-Down>", "j", { desc = "Arrow Down selection" })
