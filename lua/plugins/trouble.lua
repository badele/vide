return {
	"folke/trouble.nvim",
	cmd = { "TroubleToggle", "Trouble" },
	opts = { use_diagnostic_signs = true },
	keys = {
		{ "<leader>cd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "[C]ode Diagnostics" },
		{ "<leader>cD", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "[C]ode Workspace Diagnostics" },
		{ "<leader>cL", "<cmd>TroubleToggle loclist<cr>", desc = "[C]ode Location List" },
		{ "<leader>cQ", "<cmd>TroubleToggle quickfix<cr>", desc = "[C]ode Quickfix List" },
		{
			"<C-p>",
			function()
				if require("trouble").is_open() then
					require("trouble").previous({ skip_groups = true, jump = true })
				else
					local ok, err = pcall(vim.cmd.cprev)
					if not ok then
						vim.notify(err, vim.log.levels.ERROR)
					end
				end
			end,
			desc = "Previous trouble/quickfix item",
		},
		{
			"<C-n>",
			function()
				if require("trouble").is_open() then
					require("trouble").next({ skip_groups = true, jump = true })
				else
					local ok, err = pcall(vim.cmd.cnext)
					if not ok then
						vim.notify(err, vim.log.levels.ERROR)
					end
				end
			end,
			desc = "Next trouble/quickfix item",
		},
	},
}
