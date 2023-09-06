return {
	-- UI Component Library for Neovim.
	"MunifTanjim/nui.nvim",
	{
		lazy = false,
		config = true,
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

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
}
