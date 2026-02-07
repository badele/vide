-- Nvim Treesitter configurations and abstraction layer
return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"hcl",
			-- lua
			"lua",
			"luadoc",
			"luap",
			"python",
			"regex",
			"scala",
			"sql",
			"vim",
			"vimdoc",
		},
		auto_install = false,
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.config").setup(opts)
	end,
	keys = {
		{ "<leader>it", "<cmd>TSInstallInfo<CR>", desc = "Treesitter info" },
	},
}
