return {

	{
		"lervag/vimtex",
		lazy = false,
		config = function()
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex"
		end
	},

	-- {
	-- 	"nvim-treesitter/nvim-treesitter",
	-- 	opts = function(_, opts)
	-- 		vim.list_extend(opts.ensure_installed, { "latex" })
	-- 	end,
	-- },

	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				texlab = {},
			},
		},
	},
	--
	-- {
	-- 	"stevearc/conform.nvim",
	-- 	opts = {
	-- 		formatters_by_ft = {
	-- 			tex = { "latexindent" },
	-- 		},
	-- 	},
	-- },
	--

}
