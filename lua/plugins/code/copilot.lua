-- Lua plugin to turn github copilot into a cmp source
-- test copilot
return {
	{
		"zbirenbaum/copilot-cmp",
		dependencies = { "zbirenbaum/copilot.lua" },
		event = "InsertEnter",
		cmd = "Copilot",
		build = ":Copilot auth",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = true, auto_trigger = false },
				panel = { enabled = true, auto_refresh = true },
				auto_trigger = true,
			})
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
		end
	}
}
