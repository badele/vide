local map = require("core.utils").map

-------------------------------------------------------------------------------
-- Visual Studio Code
-------------------------------------------------------------------------------

-- Visual Studio keys mapping
map({ "i", "v", "n", "s" }, "<C-n>", "<cmd>tabnew<cr><esc>", "New file (VS)", { remap = true })
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>silent w<cr><esc>", "Save file (VS)")
map({ "i", "v", "n", "s" }, "<C-S-S>", "<cmd>silent wa<cr><esc>", "Save all files", { remap = false })
map({ "i", "v", "n", "s" }, "<C-p>", "<cmd>Telescope oldfiles<cr>", "Recently opened files (VS)", { remap = true })
map(
	{ "i", "v", "n", "s" },
	"<C-S-E>",
	'<esc><cmd>lua require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })<cr>',
	"Toogle files explorer (VS)"
)

-- Search on current bufferh
map({ "i" }, "<C-f>", "<esc>/", "Search (VS)")
map({ "v", "n", "s" }, "<C-f>", "/", "Search (VS)")

-- Search on files
map({ "i" }, "<C-S-f>", "<esc><cmd>Telescope live_grep<CR>", "Search files (VS)", { remap = true })
map({ "v", "n", "s" }, "<C-S-f>", "<cmd>Telescope live_grep<CR>", "Search files (VS)", { remap = true })

-- Search & Replace on current file
map(
	{ "n" },
	"<C-h>",
	'<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
	"Replace on current file (VS)"
)

map({ "v" }, "<C-h>", '<cmd>lua require("spectre").open_file_search({})<CR>', "Replace on current file (VS)")

-- Search & Replace
map({ "n" }, "<C-S-h>", '<esc><cmd>lua require("spectre").open_visual({select_word=true})<CR>', "Replace files (VS)")
map({ "v" }, "<C-S-h>", '<esc><cmd>lua require("spectre").open_visual({})<CR>', "Replace files (VS)")

-- shift+arrow selection
map({ "n" }, "<S-Up>", "V", "Arrow Up selection")
map({ "n" }, "<S-Down>", "V", "Arrow Down selection")
map({ "i" }, "<S-Up>", "<ESC>V", "Arrow Up selection")
map({ "i" }, "<S-Down>", "<ESC>V", "Arrow Down selection")
map({ "v" }, "<S-Up>", "k", "Arrow Up selection")
map({ "v" }, "<S-Down>", "j", "Arrow Down selection")

-------------------------------------------------------------------------------
-- MISC
-------------------------------------------------------------------------------

-- Not copy to register during change
--map({ "n" }, 'c', '"_c',  "{ remap change" })
