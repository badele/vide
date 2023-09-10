local mason_ensure_installed = {
	["null-ls"] = { -- null_ls
	},
	ansiblels = {
	},
}

local on_attach = function(client, bufnr)
	local capabilities =  vim.print((vim.lsp.get_active_clients()[1].server_capabilities))
	local nmap = function(keys, func, desc)
		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	-- Show capabilities with :lua =vim.lsp.get_clients()[1].server_capabilities
	if capabilities.hoverProvider then
		nmap("<leader>ck", vim.lsp.buf.hover, "Code Hover")
	end

	if capabilities.documentFormattingProvider then
		nmap("<leader>cf", vim.lsp.buf.format, "[C]ode [F]ormat" )
	end

	if capabilities.codeActionProvider then
		nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
	end

	nmap("<leader>cr", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

	-- See `:help K` for why this keymap
	nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })
end

-- Setup neovim lua configuration
require("neodev").setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(mason_ensure_installed),
})

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = mason_ensure_installed[server_name],
			filetypes = (mason_ensure_installed[server_name] or {}).filetypes,
		})
	end,
})
