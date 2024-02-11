return function(client, bufnr)
	local navic = require("nvim-navic")
	local register_keys = require("plugins.code.lsp.lib.keymaps")

	register_keys(client, bufnr)
	navic.attach(client, bufnr)
end
