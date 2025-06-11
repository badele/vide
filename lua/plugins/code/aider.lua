-- AI pair programming
return {
	"badele/fork-aider.nvim",
	name = "aider.nvim",
	branch = "feat/add-aider-command-parameter",
	cmd = { "AiderOpen" },
	opts = {
		aider_command = "my-aider",
		auto_manage_context = true, -- automatically manage buffer context
		default_bindings = false, -- use default <leader>A keybindings
		debug = false,            -- enable debug logging
	},
	keys = {
		{ "<leader>aa", '<cmd>AiderOpen<cr>', desc = "Aider with opened files", },
	}
}
