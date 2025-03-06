-- A tree like view for symbols in Neovim
return {
	"hedyhli/outline.nvim",
	cmd = "Outline",
	config = true,
	keys = {
		{ "<leader>tc", "<cmd>Outline<cr>", desc = "Toogle code explorer" },
	}
}
