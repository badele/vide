return {

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline" })
		end,
	},

	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				-- WARN: the TOC action only showed if documentation section change !!
				marksman = {},
			},
		},
	},

	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			linters_by_ft = {
				markdown = { "markdownlint" },
			},
		},
	},

	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				markdown = { "deno_fmt" },
			},
		},
	},

	-- {
	-- 	"OXY2DEV/markview.nvim",
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"nvim-tree/nvim-web-devicons"
	-- 	},
	-- },

	{
		"iamcco/markdown-preview.nvim",
		lazy = false,
		cmd = "MarkdownPreview",
		build = "cd app && yarn install",
	},
}
