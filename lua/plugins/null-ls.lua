return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		local n = require("null-ls")
		local actions = n.builtins.code_actions
		local completion = n.builtins.completion
		local diagnostics = n.builtins.diagnostics
		local formatting = n.builtins.formatting
		local hover = n.builtins.hover

		-- List from https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
		local sources = {
			-- misc
			actions.proselint, -- An English prose linter
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

		n.setup({
			debug = true,
			sources = sources,
		})
	end,
}

-- vim: set ts=2 sw=2 tw=0 fo=cnqoj
