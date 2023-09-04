return {
	{
		"dhruvasagar/vim-table-mode",
		cmd = "TableModeToggle",
		init = function()
			-- redefined in keys section
			vim.g.table_mode_realign_map = "" -- '<Leader>tr'  / ctr
			vim.g.table_mode_delete_row_map = "" -- '<Leader>tdd' / ctdd
			vim.g.table_mode_delete_column_map = "" -- '<Leader>tdc' / ctdc
			vim.g.table_mode_insert_column_before_map = "" -- '<Leader>tiC'
			vim.g.table_mode_insert_column_after_map = "" -- '<Leader>tic' / ctic
			vim.g.table_mode_add_formula_map = "" -- '<Leader>tfa' / ctfa
			vim.g.table_mode_eval_formula_map = "" -- '<Leader>tfe' / ctfe
			vim.g.table_mode_echo_cell_map = "" -- '<Leader>t?'  / ctf?
			vim.g.table_mode_sort_map = "" -- '<Leader>ts'  / cts
			vim.g.table_mode_tableize_map = "" -- '<Leader>tt'
			vim.g.table_mode_tableize_d_map = "" -- '<Leader>T'
		end,
		keys = {
			-- Toggle table mode
			{ "<leader>tm", "<cmd>TableModeToggle<cr>", desc = "Toggle table" },
			-- { "<leader>tm",false},
			-- { "<leader>tm", desc="+Table mode"},
			{ "<leader>tf", desc = "+Formula" },
			-- { "<leader>td", desc="+Delete"},
			-- insert & delete mode
			{ "<leader>ti", "<Plug>(table-mode-insert-column-after)", desc = "Insert column" },
			{ "<leader>tdd", "<Plug>(table-mode-delete-row)", desc = "Delete row" },
			{ "<leader>tdc", "<Plug>(table-mode-delete-column)", desc = "Delete column" },
			-- Table actions
			{ "<leader>tfa", "<cmd>TableAddFormula<cr>", desc = "Add formula" },
			{ "<leader>tfe", "<cmd>EvalFormulaLine<cr>", desc = "Evaluate formula" },
			{ "<leader>tf?", "<Plug>(table-mode-echo-cell)", desc = "Show cell pos" },
			{ "<leader>ts", "<cmd>TableSort<cr>", desc = "Sort column" },
			{ "<leader>tc", "<cmd>let g:table_mode_corner='|'<cr>", desc = "Define column(+)" },
			{ "<leader>tC", "<cmd>let g:table_mode_corner='|'<cr>", desc = "Define column(|)" },
			{ "<leader>tr", "<cmd>TableModeRealign<cr>", desc = "Realign table" },
			{ "<leader>th", "<cmd>let g:table_mode_header_fillchar='-'<cr>", desc = "Define header(-)" },
			{ "<leader>tH", "<cmd>let g:table_mode_header_fillchar='-'<cr>", desc = "Define header(=)" },
			{ "<leader>tv", "<cmd>Tableize/,<cr>", desc = "CSV to table" },
		},
	},
}
