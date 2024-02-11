-- Quickstart configs for Nvim LSP
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"SmiteshP/nvim-navic",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	keys = {
		-- Add this keys (minimal one key) for showing all lsp keys on main whichkey menu
		{ "<leader>ls", "<cmd>LspRestart<CR>", desc = "LSP Restart LSP server" },
	},

	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local opts = {
			capabilities = cmp_nvim_lsp.default_capabilities(),
			on_attach = require("plugins.code.lsp.lib.on_attach"),
		}

		local icons = require("config.icons")

		for type, icon in pairs(icons.diagnostics) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		lspconfig["bashls"].setup(opts)
		lspconfig["denols"].setup(opts)
		lspconfig["dockerls"].setup(opts) -- typescript, javascript
		lspconfig["html"].setup(opts)
		lspconfig["jsonls"].setup(opts)
		lspconfig["openscad_lsp"].setup(opts)
		lspconfig["marksman"].setup(opts) -- WARN: the TOC action only showed if documentation section change !!
		lspconfig["nixd"].setup(opts)
		lspconfig["nil_ls"].setup(opts)
		lspconfig["terraformls"].setup(opts)
		lspconfig["cssls"].setup(opts)
		lspconfig["metals"].setup(opts) -- scala
		lspconfig["ruff_lsp"].setup(opts) -- python
		lspconfig["yamlls"].setup(opts)

		lspconfig["lua_ls"].setup({
			capabilities = opts.capabilities,
			on_attach = opts.on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
