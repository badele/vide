return {
	{
		"ckolkey/ts-node-action",
		cmd = { "NodeAction", "NodeActionDebug" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {},
	},
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			local actions = null_ls.builtins.code_actions
			local completion = null_ls.builtins.completion
			local diagnostics = null_ls.builtins.diagnostics
			local formatting = null_ls.builtins.formatting
			local hover = null_ls.builtins.hover

			-- List from https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
			local sources = {
				-- misc
				-- actions.proselint, -- An English prose linter
				actions.refactoring, -- The Refactoring library  ("go", "javascript", "lua", "python", "typescript")
				actions.ts_node_action, -- A framework for running functions on Tree-sitter
				completion.luasnip, -- Snippet engine for Neovim, written in Lua.
				completion.spell, -- Spell suggestions completion source.
				completion.tags, -- Tags completion source.
				completion.vsnip, -- Snippets managed by vim-vsnip. TODO: configure,

				-- Ansible
				diagnostics.ansiblelint,

				-- shell/bash
				actions.shellcheck,
				diagnostics.shellcheck,
				formatting.shellharden,
				formatting.shfmt,
				hover.printenv,

				-- make
				diagnostics.checkmake,

				-- markdown
				diagnostics.markdownlint,
				formatting.markdownlint,

				-- web development
				formatting.deno_fmt.with({ filetypes = { "ts", "js", "markdown" } }),
				formatting.prettier.with({ filetypes = { "html", "css" } }),

				-- json
				diagnostics.jsonlint,

				-- Lua language
				diagnostics.luacheck,
				diagnostics.selene,
				formatting.stylua,

				-- Nix
				actions.statix,
				diagnostics.deadnix,
				formatting.alejandra,
				formatting.nixfmt,
				formatting.nixpkgs_fmt,

				-- Python
				diagnostics.mypy,
				diagnostics.pycodestyle,
				diagnostics.pydocstyle,
				diagnostics.pylint,
				diagnostics.ruff,
				diagnostics.semgrep,
				diagnostics.vulture,
				formatting.autoflake,
				formatting.autopep8,
				formatting.black,
			}

			null_ls.setup({
				debug = true,
				sources = sources,
				on_attach = require("core.lsp_on_attach"),
			})
		end,
	},
}

-- vim: set ts=2 sw=2 tw=0 fo=cnqoj
