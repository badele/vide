return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		local n = require("null-ls")
		local diagnostics = n.builtins.diagnostics
		local formatting = n.builtins.formatting
		local hover = n.builtins.hover

		local sources = {
			-- shell/bash
			diagnostics.shellcheck,
			formatting.shellharden,
			hover.printenv,

			-- markdown
			diagnostics.markdownlint,

			-- web development
			formatting.deno_fmt.with({ filetypes = { "ts", "js", "markdown" } }),
			formatting.prettier.with({ filetypes = { "html", "css" } }),

			-- json
			diagnostics.jsonlint.with({ filetypes = { "json" } }),

			-- Lua language
			diagnostics.luacheck,
			diagnostics.selene,
			formatting.stylua,
		}

		n.setup({
			debug = true,
			sources = sources,
		})
	end,
}

-- vim: set ts=2 sw=2 tw=0 fo=cnqoj
