local function map(mode, lhs, rhs, opts)
	vim.keymap.set(mode, lhs, rhs, opts)
end

-------------------------------------------------------------------------------
-- Visual Studio Code
-------------------------------------------------------------------------------

-- Visual Studio keys mapping
map({ "i", "v", "n", "s" }, "<C-n>", "<cmd>tabnew<cr><esc>", { desc = "New file (VS)" })
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>silent w<cr><esc>", { desc = "Save file (VS)" })
map({ "i", "v", "n", "s" }, "<C-S-S>", "<cmd>silent wa<cr><esc>", { desc = "Save all files", remap = false })
map({ "i", "v", "n", "s" }, "<C-p>", "<cmd>Telescope oldfiles<cr>", { desc = "Recently opened files (VS)" })

-- Search
map({ "i" }, "<C-f>", '<esc>/', { desc = "Search (VS)" })
map({ "v", "n", "s" }, "<C-f>", '/', { desc = "Search (VS)" })

-- Search & Replace
map({ "n" }, "<C-S-h>", '<esc><cmd>lua require("spectre").open_visual(select_word=true)<CR>',
	{ desc = "Replace files (VS)" })
map({ "v" }, "<C-S-h>", '<esc><cmd>lua require("spectre").open_visual()<CR>',
	{ desc = "Replace files (VS)" })

-- Search & Replace on current file
map({ "n",  }, "<C-h>", '<esc><cmd>lua require("spectre").open_file_search(select_word=true)<CR>',
	{ desc = "Replace on current file (VS)" })
map({ "v",  }, "<C-h>", '<esc><cmd>lua require("spectre").open_file_search()<CR>',
	{ desc = "Replace on current file (VS)" })

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

-- Not copy to register during change
map({ "n" }, 'c', '"_c', { desc = "Remap change" })
