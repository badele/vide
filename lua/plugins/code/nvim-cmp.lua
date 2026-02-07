-- Blink completion (replaces nvim-cmp)
return {
	"saghen/blink.cmp",
	version = "v1.*",
	event = "InsertEnter",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		"giuxtaposition/blink-cmp-copilot",
	},
	opts = function()
		local icons = require("config.icons").kind

		require("luasnip.loaders.from_vscode").lazy_load()

		return {
			snippets = { preset = "luasnip" },
			appearance = {
				nerd_font_variant = "mono",
				kind_icons = icons,
			},
			keymap = {
				preset = "default",
				["<C-j>"] = { "select_next" },
				["<C-k>"] = { "select_prev" },
				["<C-b>"] = { "scroll_documentation_up" },
				["<C-f>"] = { "scroll_documentation_down" },
				["<C-Space>"] = { "show" },
				["<C-e>"] = { "cancel" },
				["<CR>"] = { "accept", "fallback" },
			},
			completion = {
				documentation = { auto_show = false },
				list = { selection = { preselect = true, auto_insert = false } },
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "copilot" },
				providers = {
					copilot = {
						name = "copilot",
						module = "blink-cmp-copilot",
						score_offset = 100,
						async = true,
					},
				},
			},
		}
	end,
	keys = {
		{ "<leader>ic", "<cmd>BlinkInfo<CR>", desc = "Completion info" },
	},
}
