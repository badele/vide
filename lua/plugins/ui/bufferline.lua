-- A snazzy buffer line (with tabpage integration) for Neovim built using lua.
if not vim.g.vscode then
	return {
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		version = "*",
		opts = {},
	}
end
