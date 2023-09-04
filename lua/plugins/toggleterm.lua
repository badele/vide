return {
	"akinsho/nvim-toggleterm.lua",
	config = function()
		require("toggleterm").setup({
			size = 20,
			hide_numbers = true,
			-- open_mapping = [[<leader>y]], -- WARN: bug if enable it in insert mode (edit text)
			shade_filetypes = {},
			shade_terminals = false,
			shading_factor = 0.1,
			start_in_insert = true,
			persist_size = false,
			direction = "float",
			close_on_exit = true,
			float_opts = {
				border = "double",
				width = vim.o.columns - 8,
				height = vim.o.lines - 8,
			},
		})

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({ cmd = "lazygit" })
		local lazydocker = Terminal:new({ cmd = "lazydocker" })
		local ranger = Terminal:new({ cmd = "ranger" })

		function _lazygit()
			lazygit:toggle()
		end
		function _lazydocker()
			lazydocker:toggle()
		end
		function _ranger()
			ranger:toggle()
		end

		-- lazygit
		vim.api.nvim_set_keymap("n", "<leader>cg", "<cmd>lua _lazygit()<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>!g", "<cmd>lua _lazygit()<CR>", { noremap = true, silent = true })

		-- lazydocker
		vim.api.nvim_set_keymap("n", "<leader>!d", "<cmd>lua _lazydocker()<CR>", { noremap = true, silent = true })

		vim.api.nvim_set_keymap("n", "<leader>fe", "<cmd>lua _ranger()<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>!r", "<cmd>lua _ranger()<CR>", { noremap = true, silent = true })
	end,
}
