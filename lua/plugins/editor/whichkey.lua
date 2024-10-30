-- Create key bindings that stick. WhichKey is plugin that displays a popup with possible keybindings
return {
	"folke/which-key.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"echasnovski/mini.icons"
	},

	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		require("which-key").setup(
			{
				plugins = {
					marks = true, -- shows a list of your marks on ' and `
					registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
					-- the presets plugin, adds help for a bunch of default keybindings in Neovim
					-- No actual key bindings are created
					spelling = {
						enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
						suggestions = 20, -- how many suggestions should be shown in the list?
					},
					presets = {
						operators = true, -- adds help for operators like d, y, ...
						motions = true, -- adds help for motions
						text_objects = true, -- help for text objects triggered after entering an operator
						windows = true, -- default bindings on <c-w>
						nav = true,    -- misc bindings to work with windows
						c = true,      -- bindings for folds, spelling and others prefixed with z
						z = true,      -- bindings for folds, spelling and others prefixed with z
						g = true,      -- bindings for prefixed with g
					},
				},
				icons = {
					breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
					separator = "➜", -- symbol used between a key and it's label
					group = "+", -- symbol prepended to a group
					ellipsis = "…",
				},
				keys = {
					scroll_down = "<c-d>", -- binding to scroll down inside the popup
					scroll_up = "<c-u>", -- binding to scroll up inside the popup
				},
				win = {
					-- don't allow the popup to overlap with the cursor
					no_overlap = true,
					-- width = 1,
					-- height = { min = 4, max = 25 },
					-- col = 0,
					-- row = math.huge,
					-- border = "none",
					padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
					title = true,
					title_pos = "center",
					zindex = 1000,
					-- Additional vim.wo and vim.bo options
					bo = {},
					wo = {
						-- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
					},
				},
				-- window = {
				-- 	border = "single",    -- none, single, double, shadow
				-- 	position = "bottom",  -- bottom, top
				-- 	margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
				-- 	padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
				-- 	winblend = 5,         -- value between 0-100 0 for fully opaque and 100 for fully transparent
				-- 	zindex = 1000,        -- positive value to position WhichKey above other floating windows.
				-- },
				layout = {
					height = { min = 4, max = 25 }, -- min and max height of the columns
					width = { min = 20, max = 50 }, -- min and max width of the columns
					spacing = 3,               -- spacing between columns
					align = "left",            -- align columns left, center or right
				},
				filter = function(mapping)
					-- example to exclude mappings without a description
					-- return mapping.desc and mapping.desc ~= ""
					return true
				end,
				-- ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
				-- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
				show_help = false, -- show a help message in the command line for using WhichKey
				show_keys = true, -- show the currently pressed key and its label as a message in the command line
				-- triggers = {"<leader>"} -- or specifiy a list manually
				-- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
				delay = function(ctx)
					return ctx.plugin and 0 or 200
				end,
				triggers = {
					{ "<auto>", mode = "nxso" },
				},
				-- triggers_blacklist = {
				-- 	-- list of mode / prefixes that should never be hooked by WhichKey
				-- 	-- this is mostly relevant for keymaps that start with a native binding
				-- 	i = { "j", "k" },
				-- 	v = { "j", "k" },
				-- },
				-- disable the WhichKey popup for certain buf types and file types.
				-- Disabled by default for Telescope
				disable = {
					buftypes = {},
					filetypes = {},
				},
			})

		local wk = require("which-key")
		wk.add(
			{ {
				"<leader>c",
				group = "Code"
			}, {
				"<leader>e",
				group = "Editor"
			}, {
				"<leader>f",
				group = "Find"
			}, {
				"<leader>i",
				group = "Info"
			}, {
				"<leader>ih",
				"<cmd>checkhealth<cr>",
				desc = "Healthcheck info"
			}, {
				"<leader>iz",
				"<cmd>Lazy<cr>",
				desc = "Lazy info"
			}, {
				"<leader>g",
				group = "Git"
			}, {
				"<leader>l",
				group = "LSP"
			}, {
				"<leader>m",
				group = "Misc"
			}, {
				"<leader>s",
				group = "Search"
			}, {
				"<leader>t",
				group = "Toggle"
			}, {
				"<leader>tC",
				"<Cmd>set conceallevel=3<cr>",
				desc = "Enable conceal"
			}, {
				"<leader>tc",
				"<Cmd>set conceallevel=0<cr>",
				desc = "Disable conceal"
			}, {
				"<leader>tr",
				"<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><cr>",
				desc = "Disable search highlight"
			}, {
				"<leader>u",
				group = "User"
			}, {
				"<leader>x",
				group = "Diagnostic"
			}, {
				"<localleader>l",
				group = "Latex"
			}, {
				"<localleader>m",
				group = "Markdown"
			} }
		)
	end,
}
