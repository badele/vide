-- markdown preview plugin for (neo)vim
return {
	"iamcco/markdown-preview.nvim",
	lazy = false,
	cmd = "MarkdownPreview",
	build = "cd app && yarn install",
}
