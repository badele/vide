return {

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { "bash" })
		end,
	},

	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				bashls = {},
			},
		},
	},

	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				sh = { "shfmt" },
			},
		},
	},

}
