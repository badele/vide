return {
	-- convert to tree
	{ "xorid/asciitree.nvim" },
	-- UI Component Library for Neovim.
	{ "MunifTanjim/nui.nvim" },
	{ "onsails/lspkind.nvim" },

	-- Colorizer
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	-- Replace vim filetype detection
	{
		"nathom/filetype.nvim",
		opts = {
			overrides = {
				extensions = {
					plt = "gnuplot",
					sql = "sql",
					sh = "sh",
					scad = "openscad",
				},
			},
		},
	},

	-- Translate
	{
		"potamides/pantran.nvim",
		opts = {
			default_engine = "argos",
			engines = {
				argos = {
					-- Default languages can be defined on a per engine basis. In this case
					-- `:lua require("pantran.async").run(function()
					-- vim.pretty_print(require("pantran.engines").yandex:languages()) end)`
					-- can be used to list available language identifiers.
					default_source = "auto",
					default_target = "fr",
				},
			},
		},
	},

	{
		lazy = false,
		config = true,
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Detect tabstop and shiftwidth automatically
	{ "tpope/vim-sleuth" },

	-- Useful plugin to show you pending keybinds.
	{ "folke/which-key.nvim", opts = {} },

	-- Theme
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight-moon")
		end,
	},

	{
		"stevearc/dressing.nvim",
		opts = {},
	},

	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
		config = true,
	},

	{
		"iamcco/markdown-preview.nvim",
		lazy = false,
		cmd = "MarkdownPreview",
		build = "cd app && yarn install",
	},

	{
		"junegunn/vim-easy-align",
		cmd = "EasyAlign",
	},

	-- Ledger-cli
	{ "ledger/vim-ledger" },

	-- justfile
	{ "NoahTheDuke/vim-just" },
}
