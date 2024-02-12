local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "plugins.code" },
	{ import = "plugins.code.comment" },
	{ import = "plugins.code.completion" },
	{ import = "plugins.code.languages" },
	{ import = "plugins.code.lsp" },
	{ import = "plugins.editor" },
	{ import = "plugins.ui" },
}, {
	install = {
		colorscheme = { "tokyonight-moon" },
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
