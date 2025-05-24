-- Lua plugin to turn github copilot into a cmp source
return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = true, auto_trigger = false },
				panel = { enabled = true, auto_refresh = true },
			})
		end,
	},

	{
		"zbirenbaum/copilot-cmp",
		dependencies = { "zbirenbaum/copilot.lua" },
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
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
