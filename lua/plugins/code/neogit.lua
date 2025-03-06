-- An interactive and powerful Git interface for Neovim, inspired by Magit
return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",       -- required
		"sindrets/diffview.nvim",      -- optional - Diff integration
		"nvim-telescope/telescope.nvim", -- optional
	},
	opts = {
		disable_insert_on_commit = false,
		kind = "replace",
		sections = {
			recent = {
				folded = false,
				hidden = false,
			},
		},
	},
}
