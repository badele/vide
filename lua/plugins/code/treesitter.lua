-- Nvim Treesitter configurations and abstraction layer
return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"c",
				"dockerfile",
				"javascript",
				"hcl",
				-- lua
				"lua",
				"luadoc",
				"luap",
				-- markdown
				"markdown",
				"markdown_inline",
				"nix",
				"python",
				"regex",
				"scala",
				"sql",
				"terraform",
				"typescript",
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
			incremental_selection = {
				-- i use % key to jump to matching brackets
				enable = false,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "grn",
					sgope_incremental = "grc",
					node_decremental = "grm",
				},
			},
		})
	end,
}
