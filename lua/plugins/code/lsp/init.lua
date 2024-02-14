-- Quickstart configs for Nvim LSP
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"SmiteshP/nvim-navic",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	opts = {
		servers = {
		},
	},
	keys = {
		-- Add this keys (minimal one key) for showing all lsp keys on main whichkey menu
		{ "<leader>ls", "<cmd>LspRestart<CR>", desc = "LSP Restart LSP server" },
	},

	config = function(_,opts)
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local icons = require("config.icons")

		-- Define LSP signs
		for type, icon in pairs(icons.diagnostics) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local srvopts = {
			capabilities = cmp_nvim_lsp.default_capabilities(),
			on_attach = require("plugins.code.lsp.lib.on_attach"),
		}

		for server_name, server_config in pairs(opts.servers) do
			server_config.capabilities = srvopts.capabilities
			server_config.on_attach = srvopts.on_attach
			lspconfig[server_name].setup(server_config)
		end
		--
		-- lspconfig["lua_ls"].setup({
		-- 	settings = { -- custom settings for lua
		-- 		Lua = {
		-- 			-- make the language server recognize "vim" global
		-- 			diagnostics = {
		-- 				globals = { "vim" },
		-- 			},
		-- 			workspace = {
		-- 				-- make language server aware of runtime files
		-- 				library = {
		-- 					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
		-- 					[vim.fn.stdpath("config") .. "/lua"] = true,
		-- 				},
		-- 			},
		-- 		},
		-- 	},
		-- })
	end,
}
