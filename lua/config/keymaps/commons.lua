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
map({ "n", "i", "t" }, "<C-t>", "<cmd>ToggleTerm<cr>", "Show tt[Y] terminal", { remap = true })
map({ "n" }, "<M-q>", "<cmd>bdelete<cr>", "Close buffer", { remap = true })
map({ "n" }, "<localleader>mp", "<cmd>MarkdownPreview<cr>", "[M]arkdown preview", { remap = true })
map(
	{ "n" },
	"<leader>mdl",
	"<cmd>lua print(vim.inspect(vim.lsp.get_active_clients()))<cr>",
	"[M]isc [D]ebug show active [L]SP",
  { remap = true }
)

-- Custom help
map({ "n", "i", "v", "x" }, "<F1>", "<cmd>help Vide<cr>", "Show VIDE help", { })
map({ "n", "i", "v", "x" }, "<F13>", "<cmd>helptags ~/.config/nvim/doc<cr>", "Refresh VIDE helptags", { })
map({ "n" }, "<K>", "<C-]", "Goto help anchor", { })

-- Indent
map("v", ">", ">gv", "Indent >", { })
map("v", "<", "<gv", "Indent <", { })

-- Misc => Translate
-- local pantran = require('pantran')
--map({ "n" }, "<leader>mt", "<cmd>Pantran<cr>", { desc = "[T]ranslate", remap = true })
--map({ "x" }, "<leader>mt", pantran.motion_translate, { desc = "[T]ranslate", remap = true, expr = true })

-- Split Windows
map("n", "<leader>|", "<C-W>v", "Split window right",{ remap = true })
map("n", "<leader>-", "<C-W>s", "Split window below",{ remap = true })

-- Files
map("n", "<leader>fn", "<cmd>tabnew|startinsert <cr>", "[F]ile [N]ew", { })
map("n", "<leader>fr", "<cmd>Neotree reveal<cr>", "[F]ile [R]eveal", { })

-- treesitter mode
map("n", "<leader>ut", "<cmd>lua vim.treesitter.start()<cr>","[U]ser [t]reesitter enable",  { })
map("n", "<leader>uT", "<cmd>lua vim.treesitter.stop()<cr>", "[U]ser [T]reesitter disable", { })

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
map("n", "[d", vim.diagnostic.goto_prev, "Go to previous diagnostic message",{ })
map("n", "]d", vim.diagnostic.goto_next, "Go to next diagnostic message",{ })
map("n", "<leader>e", vim.diagnostic.open_float, "Open floating diagnostic message",{ })
map("n", "<leader>q", vim.diagnostic.setloclist, "Open diagnostics list",{ })
