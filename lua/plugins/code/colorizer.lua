-- The fastest Neovim toto (hex color)
-- Colorizer is a fast Neovim plugin for highlighting hex color codes in code.
return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup()
	end,
}
