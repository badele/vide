-- Git integration for buffers
return {
	"lewis6991/gitsigns.nvim",
	lazy = false,
	opts = {
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns
			local map = require("core.utils").map
			local opts = { buffer = bufnr }

			map("n", "<leader>gd", gs.diffthis, "[G]it [D]iff", opts)
			map("n", "<leader>gn", gs.next_hunk, "[G]it [N]ext hunk", opts)
			map("n", "<leader>gp", gs.prev_hunk, "[G]it [P]rev hunk", opts)
			map("n", "<leader>gs", "<cmd>Neogit<cr>", "[G]it [S]tatus", opts)
		end,
	},
}
