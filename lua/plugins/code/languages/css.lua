return {

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { "css" })
		end,
	},

	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				cssls = {},
			},
		},
	},

}
