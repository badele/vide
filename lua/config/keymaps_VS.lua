local function map(mode, lhs, rhs, opts)
	vim.keymap.set(mode, lhs, rhs, opts)
end

-------------------------------------------------------------------------------
-- Visual Studio Code
-------------------------------------------------------------------------------

-- Visual Studio keys mapping
map({ "i", "v", "n", "s" }, "<C-n>", "<cmd>tabnew<cr><esc>", { desc = "New file (VS)" })
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>silent w<cr><esc>", { desc = "Save file (VS)" })
map({ "i", "v", "n", "s" }, "<C-p>", "<cmd>Telescope oldfiles<cr>", { desc = "Recently opened files (VS)" })


-- Error or Warning navigation
map({ "n", "i" }, "<F8>", vim.diagnostic.goto_next, { desc = "Go to next problem (VS)" })
map({ "n", "i" }, "<F20>", vim.diagnostic.goto_prev, { desc = "Go to prev problem (VS)" })


-- shift+arrow selection
map({ "n" }, "<S-Up>", "V", { desc = "Arrow Up selection" })
map({ "n" }, "<S-Down>", "V", { desc = "Arrow Down selection" })
map({ "i" }, "<S-Up>", "<ESC>V", { desc = "Arrow Up selection" })
map({ "i" }, "<S-Down>", "<ESC>V", { desc = "Arrow Down selection" })
map({ "v" }, "<S-Up>", "k", { desc = "Arrow Up selection" })
map({ "v" }, "<S-Down>", "j", { desc = "Arrow Down selection" })

-------------------------------------------------------------------------------
-- MISC
-------------------------------------------------------------------------------

-- Save all buffers
map({ "i", "v", "n", "s" }, "<C-S-S>", "<cmd>silent wa<cr><esc>", { desc = "Save all files", remap = false })

-- Not copy to register during change
map({ "n", "i" }, 'c', '"_c', { desc = "Remap change" })
