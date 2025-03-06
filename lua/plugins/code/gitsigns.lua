-- Git integration for buffers
return {
	"lewis6991/gitsigns.nvim",
	lazy = false,
	opts = {
		current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
		linehl             = true, -- Toggle with `:Gitsigns toggle_linehl`
		numhl              = true, -- Toggle with `:Gitsigns toggle_numhl`
		signcolumn         = true, -- Toggle with `:Gitsigns toggle_signs`
		word_diff          = true, -- Toggle with `:Gitsigns toggle_word_diff`
	},
	keys = {
		{ "<leader>gd", '<cmd>lua require("gitsigns").diffthis()<cr>',  desc = "gitsigns diff", },
		{ "<leader>gn", '<cmd>lua require("gitsigns").next_hunk()<cr>', desc = "git next hunk", },
		{ "<leader>gp", '<cmd>lua require("gitsigns").prev_hunk()<cr>', desc = "git previous hunk", },
		{ "<leader>gs", '<cmd>Neogit<cr>',                              desc = "git status", },

		{ "<leader>cf", '<cmd>Format<cr>',                              desc = "Format code", },
		{ '<leader>if', '<cmd>ConformInfo<cr>',                         desc = "Format(conform) info" }
	},
}
