return function(_, bufnr)
	local map = vim.keymap.set

	local opts = { noremap = true, silent = true }
	opts.buffer = bufnr

	opts.desc = "LSP reference"
	map("n", "lR", "<cmd>Telescope lsp_references<CR>", opts)

	opts.desc = "LSP go to declaration"
	map("n", "gD", vim.lsp.buf.declaration, opts)

	opts.desc = "LSP go definitions"
	map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

	opts.desc = "LSP go to implementations"
	map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

	opts.desc = "LSP goto type definitions"
	map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

	opts.desc = "LSP action"
	map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)

	opts.desc = "LSP rename"
	map("n", "<leader>lr", vim.lsp.buf.rename, opts)

	opts.desc = "LSP show diagnostics"
	map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

	opts.desc = "LSP show line diagnostics"
	map("n", "<leader>d", vim.diagnostic.open_float, opts)

	opts.desc = "LSP next diagnostic"
	map("n", "<leader>ln", vim.diagnostic.goto_next, opts)

	opts.desc = "LSP previous diagnostic"
	map("n", "<leader>lp", vim.diagnostic.goto_prev, opts)

	opts.desc = "LSP show documentation for what is under cursor"
	map("n", "K", vim.lsp.buf.hover, opts)

	opts.desc = "LSP show Info"
	map("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
end
