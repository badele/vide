-- The fastest Neovim colorizer (hex color)
return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup()
	end,
}
