return {

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { "json" })
		end,
	},

	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				jsonls = {},
			},
		},
	},

}
