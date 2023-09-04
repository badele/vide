-- TODO: convert to local function
function _G.Toggle_venn()
	local venn_enabled = vim.inspect(vim.b.venn_enabled)
	if venn_enabled == "nil" then
		vim.b.venn_enabled = true
		vim.cmd([[setlocal ve=all]])
		-- draw a line on HJKL keystokes
		vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", { noremap = true })
		-- draw a box by pressing "f" with visual selection
		vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", { noremap = true })
		print("Diagram(venn) enable | f:draw box, H,J,K,L: draw line")
	else
		vim.cmd([[setlocal ve=]])
		vim.cmd([[mapclear <buffer>]])
		vim.b.venn_enabled = nil
		print("Diagram(venn) disable")
	end
end

return {
	"jbyuki/venn.nvim",
	lazy = false,
	keys = {
		{ "<leader>md", ":lua Toggle_venn()<CR>", desc = "Toggle diagram box" },
	},
}
