return {

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { "yaml" })
		end,
	},

	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				yamlls = {},
			},
		},
	},

}
