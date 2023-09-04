return {
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		dependencies = {
			-- Completion
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-calc",
			{
				"tzachar/cmp-tabnine",
				build = "./install.sh",
			},
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",

			-- Snippets
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
}
