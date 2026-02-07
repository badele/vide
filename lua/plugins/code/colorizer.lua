-- The fastest Neovim toto (hex color)
-- Colorizer is a fast Neovim plugin for highlighting hex color codes in code.
return {
	"catgoose/nvim-colorizer.lua",
	config = function()
		-- Override deprecated vim.tbl_flatten to a non-deprecated equivalent
		vim.tbl_flatten = function(t)
			return vim.iter(t):flatten():totable()
		end

		require("colorizer").setup()
	end,
}
