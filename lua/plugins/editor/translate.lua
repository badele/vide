-- This is a test of the pantran plugin
return {
	{
		"potamides/pantran.nvim",
		config = function()
			local pantran = require("pantran")
			pantran.setup({
				default_engine = "google",
				engines = {
					google = {
						fallback = {
							default_source = "auto",
							default_target = "fr",
						},
					},
				},
			})

			local opts = { noremap = true, silent = true, expr = true }
			vim.keymap.set("n", "<leader>mt", function()
				return pantran.motion_translate() .. "_"
			end, opts)
			vim.keymap.set("x", "<leader>mt", pantran.motion_translate, opts)
		end,
	},
}
