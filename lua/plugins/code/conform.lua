-- Lightweight yet powerful formatter plugin for Neovim

local function formatBuffer(bufnr)
	-- if bufnr is not provided, it will format the current buffer
	local opts = {
		bufnr = bufnr,
		timeout_ms = 1000,
		async = false,
		quiet = false,
		lsp_fallback = true,
	}
	require("conform").format(opts)
end

local function formatOnSave(bufnr)
	if vim.g.disable_autoformat then
		return
	end

	formatBuffer(bufnr)
end

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
	},
	init = function()
		local conform_augroup = vim.api.nvim_create_augroup("conform", { clear = true })

		-- Save on write
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = conform_augroup,
			callback = function(args)
				formatOnSave(args.buf)
			end,
		})

		-- Disable format on save
		vim.api.nvim_create_user_command("FormatDisable", function()
			vim.g.disable_autoformat = true
		end, {
			desc = "Disable autoformat-on-save(conform)",
			bang = true,
		})

		-- Enable format on save
		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save(conform)",
		})

		-- Format
		vim.api.nvim_create_user_command("Format", function()
			formatBuffer()
		end, {
			desc = "Format (conform)",
		})

		-- Get format info
		vim.api.nvim_create_user_command("FormatInfo", function()
			require("conform.health").show_window()
		end, {
			desc = "Format info(conform)",
		})
	end,
	keys = {
		{ "<leader>cf", '<cmd>Format<cr>',      desc = "Format code", },
		{ '<leader>if', '<cmd>ConformInfo<cr>', desc = "Format(conform) info" }
	},
}
