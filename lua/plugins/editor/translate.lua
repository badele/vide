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

			opts.desc = "Translate the current line"
			vim.keymap.set("n", "<localleader>t", function()
				return pantran.motion_translate() .. "_"
			end, opts)

			opts.desc = "Translate the current visual selection"
			vim.keymap.set("x", "<localleader>t", pantran.motion_translate, opts)
		end,
	},
}
