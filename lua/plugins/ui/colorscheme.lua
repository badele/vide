-- A clean, dark Neovim theme written in Lua
return {
	"folke/tokyonight.nvim",
	priority = 99,
	config = function()
		vim.cmd.colorscheme("tokyonight-moon")
	end,
}
