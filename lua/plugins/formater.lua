return {
	"mhartington/formatter.nvim",
	config = function()
		-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
		require("formatter").setup({
			logging = true,
			log_level = vim.log.levels.DEBUG,
			-- All formatter configurations are opt-in
			filetype = {
				-- lua = {
				-- 	require("formatter.filetypes.lua").stylua,
				-- 	-- require("formatter.filetypes.lua").luafmt,
				-- },
				--
				-- markdown = {
				-- 	require("formatter.filetypes.markdown").prettier,
				-- 	-- require("formatter.filetypes.nix").nixfmt,
				-- },
				--
				-- nix = {
				-- 	require("formatter.filetypes.nix").alejandra,
				-- 	-- require("formatter.filetypes.nix").nixfmt,
				-- },

				python = {
					-- require("formatter.filetypes.python").black,
					require("formatter.filetypes.python").black
					-- require("formatter.filetypes.nix").nixfmt,
				},

				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
	end,
}
