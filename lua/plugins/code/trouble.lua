-- A pretty diagnostics, references, telescope results, quickfix and location list
return {
	"folke/trouble.nvim",
	cmd = { "Trouble" },
	opts = { use_diagnostic_signs = true },
	keys = {
		{ "<leader>cd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Document diagnostics" },
		{ "<leader>cD", "<cmd>Trouble diagnostics toggle<cr>",              desc = "Workspace Diagnostics" },
		{ "<leader>cH", "<cmd>lua vim.diagnostic.open_float()<cr>",         desc = "Hint Diagnostics" },
		{ "<leader>cl", "<cmd>Trouble loclist toggle<cr>",                  desc = "Location List" },
		{ "<leader>cq", "<cmd>Trouble qflist toggle<cr>",                   desc = "Quickfix List" },

		{ "<leader>cn", "<cmd>lua vim.diagnostic.jump({count=1,float=false})<cr>",  desc = "Goto next diagnostic" },
		{ "<leader>cp", "<cmd>lua vim.diagnostic.jump({count=-1,float=false})<cr>", desc = "Goto prev diagnostic" },

		{ "gn",         "<cmd>lua vim.diagnostic.jump({count=1,float=false})<cr>",  desc = "Goto next diagnostic" },
		{ "gp",         "<cmd>lua vim.diagnostic.jump({count=-1,float=false})<cr>", desc = "Goto prev diagnostic" },
	},
}
