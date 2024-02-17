-- A pretty diagnostics, references, telescope results, quickfix and location list
return {
	"folke/trouble.nvim",
	cmd = { "TroubleToggle", "Trouble" },
	opts = { use_diagnostic_signs = true },
	keys = {
		{ "<leader>cd", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document diagnostics" },
		{ "<leader>cD", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
		{ "<leader>ch", "<cmd>lua vim.diagnostic.open_float()<cr>",     desc = "Hint Diagnostics" },
		{ "<leader>cl", "<cmd>TroubleToggle loclist<cr>",               desc = "Location List" },
		{ "<leader>cq", "<cmd>TroubleToggle quickfix<cr>",              desc = "Quickfix List" },

		{ "<leader>cn", "<cmd>lua vim.diagnostic.goto_next()",          desc = "Goto next diagnostic" },
		{ "<leader>cp", "<cmd>lua vim.diagnostic.goto_prev()",          desc = "Goto prev diagnostic" },

		{ "gn",         "<cmd>lua vim.diagnostic.goto_next()<cr>",      desc = "Goto next diagnostic" },
		{ "gp",         "<cmd>lua vim.diagnostic.goto_prev()<cr>",      desc = "Goto prev diagnostic" },
	},
}
