-- Smart and powerful comment plugin for neovim.
return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		padding = true,
		sticky = true,
		ignore = nil,
		toggler = {
			line = "<leader>/",
			block = "<leader>*",
		},
		opleader = {
			line = "<leader>/",
			block = "<leader>*",
		},
		extra = {
			above = "gcO",
			below = "gco",
			eol = "gcA",
		},
		mappings = {
			basic = true,
			extra = false,
		},
		pre_hook = nil,
		post_hook = nil,
	},
	config = function(_, opts)
		require("Comment").setup(opts)
		local ft = require("Comment.ft")
		ft.openscad = { "//%s", "/*%s*/" }
	end
}
