return {
	"greggh/claude-code.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required for git operations
	},
	config = function()
		require("claude-code").setup()
	end,
	keys = {
		{ "<leader>cc", '<cmd>ClaudeCode<cr>', desc = "Claude Code", },
	}
}
