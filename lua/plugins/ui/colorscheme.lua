-- A clean, dark Neovim theme written in Lua
if not vim.g.vscode then
	return {
		"folke/tokyonight.nvim",
		priority = 99,
		config = function()
			vim.cmd.colorscheme("tokyonight-moon")
		end,
	}
end
