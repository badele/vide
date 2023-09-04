return {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = {
		{ "onsails/lspkind.nvim" },
		{ "SmiteshP/nvim-navic" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "folke/neodev.nvim" },
		{ "j-hui/fidget.nvim", tag = "legacy", opts = {} },
		{ "williamboman/mason.nvim", config = true },
	},
}
