return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			sh = {},      -- bashls
			javascript = {}, -- denols
			typescript = {}, -- denols
			lua = {},     -- lua_ls
			openscad = {}, -- openscad_lsp
			python = {},  -- ruff_lsp
			scala = {},   -- metals
			yaml = {}     -- yamlls,
		}

		-- define global vim variable (used by the neovim plugins code)
		local luacheck = require('lint').linters.luacheck
		luacheck.args = { '--global', 'vim', '--formatter', 'plain', '--codes', '--ranges', '-' }

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
	keys = {
		{
			"<leader>cl",
			"<cmd>lua require('lint').try_lint()<cr>",
			desc = "Lint current file",
		},
	},
}
