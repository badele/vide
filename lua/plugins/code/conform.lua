-- Lightweight yet powerful formatter plugin for Neovim
return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = {}, -- denols
				json = { "deno_fmt" },
				lua = {},    --lua_ls
				nix = { "nixfmt" },
				openscad = {}, -- openscad_lsp
				python = {}, -- ruff_lsp
				scala = {},  -- metals
				sh = { "shellharden" },
				typescript = {}, -- denols
				yaml = {}    -- yamlls,

			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})
	end,
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})
			end,
			desc = "Format code",
		},
	},
}
