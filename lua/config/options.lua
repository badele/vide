--  WARN: The leader must be define here, it's used for other plugins
vim.g.mapleader = " "
vim.g.maplocalleader = ";"

-- Disable provider
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

local opt = vim.opt

opt.autowrite = true           -- Enable auto write
opt.autochdir = false          -- change dir from buffer
opt.clipboard = "unnamedplus"  -- Sync with system clipboard
opt.colorcolumn = "80"         -- Show limitation columns
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3           -- Hide * markup for bold and italic
opt.confirm = true             -- Confirm to save changes before exiting modified buffer
opt.cursorline = true          -- Enable highlighting of the current line
opt.expandtab = true           -- Use spaces instead of tabs
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true      -- No Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 3         -- Force to show global line, used by lualine
opt.list = true            -- Show some invisible characters (tabs...
opt.listchars = {
	tab = ">>",
	-- lead     = ".",
	trail = "󰅨",
	precedes = "←",
	extends = "→",
	eol = "⤶",
	nbsp = "␣",
}

opt.mouse = "a"                                         -- Enable mouse mode
opt.number = true                                       -- Print line number
opt.pumblend = 0                                        -- Popup blend, cmp popup
opt.pumheight = 10                                      -- Maximum number of entries in a popup
opt.relativenumber = false                              -- Relative line numbers
opt.scrolloff = 4                                       -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true                                   -- Round indent
opt.shiftwidth = 2                                      -- Size of an indent
opt.shortmess:append({ W = false, I = true, c = true }) -- Hide some messages
opt.showmode = false                                    -- Dont show mode since we have a statusline
opt.sidescrolloff = 8                                   -- Columns of context
opt.signcolumn =
"yes"                                                   -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true                                    -- Don't ignore case with capitals
opt.smartindent = true                                  -- Insert indents automatically
opt.spelllang = { "en" }
opt.splitbelow = true                                   -- Put new windows below current
opt.splitright = true                                   -- Put new windows right of current
opt.tabstop = 2                                         -- Number of spaces tabs count for
opt.termguicolors = true                                -- True color support
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200               -- Save swap file and trigger CursorHold
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5                -- Minimum window width
opt.wrap = false                   -- Disable line wrap

vim.markdown_fenced_languages = {
	"bash",
	"comment",
	"dockerfile",
	"go",
	"json",
	"jsonc",
	"lua",
	"markdown",
	"markdown_inline",
	"nix",
	"python",
	"query",
	"regex",
	"scala",
	"terraform",
	"typescript",
	"ts:typescript",
	"vim",
	"vimdoc",
	"yaml",
}

-- if vim.fn.has("nvim-0.9.0") == 1 then
-- 	opt.splitkeep = "screen"
-- 	opt.shortmess:append({ C = true })
-- end
