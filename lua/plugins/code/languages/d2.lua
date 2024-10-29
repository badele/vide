return {
	{
		"terrastruct/d2-vim",
		ft = { "d2" }
	},

	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				d2 = { "d2" },
			},
		},
	},

}
