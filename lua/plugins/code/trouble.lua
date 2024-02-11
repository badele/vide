-- A pretty diagnostics, references, telescope results, quickfix and location list
return {
	"folke/trouble.nvim",
	cmd = { "TroubleToggle", "Trouble" },
	opts = { use_diagnostic_signs = true },
	keys = {
		{ "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document diagnostics" },
		{ "<leader>xD", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
		{ "<leader>xh", "<cmd>lua vim.diagnostic.open_float()<cr>",     desc = "Hint Diagnostics" },
		{ "<leader>xl", "<cmd>TroubleToggle loclist<cr>",               desc = "Location List" },
		{ "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",              desc = "Quickfix List" },

		{ "<leader>xn", "<cmd>lua vim.diagnostic.goto_next()",          desc = "Goto next diagnostic" },
		{ "<leader>xp", "<cmd>lua vim.diagnostic.goto_prev()",          desc = "Goto prev diagnostic" },

		{ "gn",         "<cmd>lua vim.diagnostic.goto_next()<cr>",      desc = "Goto next diagnostic" },
		{ "gp",         "<cmd>lua vim.diagnostic.goto_prev()<cr>",      desc = "Goto prev diagnostic" },
	},
}
