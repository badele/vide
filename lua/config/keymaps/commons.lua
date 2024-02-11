-- :h map-listing
--   CHAR	MODE
--   <Space>	Normal, Visual, Select and Operator-pending
--   n		Normal
--   v		Visual and Select
--   s		Select
--   x		Visual
--   o		Operator-pending
--   !		Insert and Command-line
--   i		Insert
--   l		":lmap" mappings for Insert, Command-line and Lang-Arg
--   c		Command-line
--   t		Terminal-Job

local map = require("core.utils").map

------------------------------------------------------------------------------
-- Misc
------------------------------------------------------------------------------
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>silent w<cr><esc>", "Save file (VS)")
map({ "n", "i", "t" }, "<C-t>", "<cmd>ToggleTerm<cr>", { desc = "Show tt[Y] terminal", remap = true })
map({ "n" }, "<M-q>", "<cmd>bdelete<cr>", { desc = "Close buffer", remap = true })
map({ "n" }, "<leader>mm", "<cmd>MarkdownPreview<cr>", { desc = "[M]arkdown preview", remap = true })
map(
	{ "n" },
	"<leader>mdl",
	"<cmd>lua print(vim.inspect(vim.lsp.get_active_clients()))<cr>",
	{ desc = "[M]isc [D]ebug show active [L]SP", remap = true }
)

-- Custom help
map({ "n", "i", "v", "x" }, "<F1>", "<cmd>help Vide<cr>", { desc = "Show VIDE help" })
map({ "n", "i", "v", "x" }, "<F13>", "<cmd>helptags ~/.config/nvim/doc<cr>", { desc = "Refresh VIDE helptags" })
map({ "n" }, "<K>", "<C-]", { desc = "Goto help anchor" })

-- Indent
map("v", ">", ">gv", { desc = "Indent >" })
map("v", "<", "<gv", { desc = "Indent <" })

-- Misc => Translate
-- local pantran = require('pantran')
--map({ "n" }, "<leader>mt", "<cmd>Pantran<cr>", { desc = "[T]ranslate", remap = true })
--map({ "x" }, "<leader>mt", pantran.motion_translate, { desc = "[T]ranslate", remap = true, expr = true })

-- Split Windows
map("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })

-- Files
map("n", "<leader>fn", "<cmd>tabnew|startinsert <cr>", { desc = "[F]ile [N]ew" })
map("n", "<leader>fr", "<cmd>Neotree reveal<cr>", { desc = "[F]ile [R]eveal" })

-- User interface
map("n", "<leader>ur", "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><cr>", { desc = "[U]ser [R]eset UI" })
map("n", "<leader>us", "<cmd>SymbolsOutline<cr>", { desc = "[U]ser [S]ymbols outline" })

-- conceal mode /  TODO: convert to toggle
map("n", "<leader>uc", "<cmd>set conceallevel=0<cr>", { desc = "[U]ser [c]onceal show" })
map("n", "<leader>uC", "<cmd>set conceallevel=3<cr>", { desc = "[U]ser [c]onceal hide" })

-- treesitter mode
map("n", "<leader>ut", "<cmd>lua vim.treesitter.start()<cr>", { desc = "[U]ser [t]reesitter enable" })
map("n", "<leader>uT", "<cmd>lua vim.treesitter.stop()<cr>", { desc = "[U]ser [T]reesitter disable" })

---- map('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [K]eymaps' })
---- map('n', "<leader>sr", require("spectre").open, { desc = "[S]earch & Replace in files (Spectre)"})
---- map('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
-- map('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })

-- Telescope
-- See `:help telescope.builtin`

-- Remap for dealing with word wrap
--map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
--map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
