-- Quickstart configs for Nvim LSP
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"saghen/blink.cmp",
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
		-- info
		{ "<leader>il", "<cmd>LspInfo<CR>",    desc = "LSP info" },
	},

	config = function(_, opts)
		vim.lsp.set_log_level("warn")

		local icons = require("config.icons")
		local blink_cmp = require("blink.cmp")

		local severity = vim.diagnostic.severity
		vim.diagnostic.config({
			signs = {
				text = {
					[severity.ERROR] = icons.diagnostics.Error,
					[severity.WARN] = icons.diagnostics.Warn,
					[severity.HINT] = icons.diagnostics.Hint,
					[severity.INFO] = icons.diagnostics.Info,
				},
				numhl = {
					[severity.ERROR] = "DiagnosticSignError",
					[severity.WARN] = "DiagnosticSignWarn",
					[severity.HINT] = "DiagnosticSignHint",
					[severity.INFO] = "DiagnosticSignInfo",
				},
			},
		})

		local srvopts = {
			capabilities = blink_cmp.get_lsp_capabilities(),
			on_attach = require("plugins.code.lsp.lib.on_attach"),
		}

		srvopts.capabilities.offsetEncoding = { "utf-8" }


		for server_name, server_config in pairs(opts.servers) do
			server_config.capabilities = srvopts.capabilities
			server_config.on_attach = srvopts.on_attach

			vim.lsp.config(server_name, server_config)
			vim.lsp.enable(server_name)
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
