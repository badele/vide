return {
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		dependencies = {
			-- lua snip user
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",

			-- For ultisnips users.
			'SirVer/ultisnips',
			'quangnguyen30192/cmp-nvim-ultisnips',

			-- snippy users.
			'dcampos/nvim-snippy',
			'dcampos/cmp-snippy',

			-- Snippets
			"rafamadriz/friendly-snippets",
			'hrsh7th/vim-vsnip',
			'hrsh7th/vim-vsnip-integ',

			-- Completion
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-calc",
			'hrsh7th/cmp-cmdline',
			'hrsh7th/cmp-vsnip',
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			{
				"tzachar/cmp-tabnine",
				build = "./install.sh",
			},
		},
	},
}
