-- AI pair programming
return {
	"joshuavial/aider.nvim",
	cmd = { "AiderOpen" },
	opts = {
		auto_manage_context = true, -- automatically manage buffer context
		default_bindings = false, -- use default <leader>A keybindings
		debug = false,            -- enable debug logging
	},
	keys = {
		{ "<leader>aa", '<cmd>AiderOpen<cr>', desc = "Aider with opened files", },
	}
}
