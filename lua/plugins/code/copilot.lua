-- GitHub Copilot core integration (used by Blink source)
return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				server_opts_overrides = {
					capabilities = {
						offsetEncoding = { "utf-8" },
					},
				},
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},

	{
		"jonahgoldwastaken/copilot-status.nvim",
		dependencies = { "zbirenbaum/copilot.lua" },
		event = "BufReadPost",
		config = function()
			require('copilot_status').setup({
				debug = false,
			})
		end,
	},
}
