local ideconfig = require("custom.ideconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local cmp = require("cmp")
local luasnip = require("luasnip")
local luasnipVS = require("luasnip.loaders.from_vscode")
local lspkind = require("lspkind")
local cmp_window = require "cmp.config.window"

luasnipVS.lazy_load()
luasnip.config.setup({})

cmp.setup({
	-- WARN: not modify the order
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "treesitter" },
		{ name = "path" },

		{ name = 'vsnip' },   -- For vsnip users.
		{ name = 'luasnip' }, -- For luasnip users.
		{ name = 'ultisnips' }, -- For ultisnips users.
		{ name = 'snippy' },  -- For snippy users.

		{ name = "buffer" },
		{ name = "calc" },
		{ name = "cmp_tabnine" },
		{ name = "emoji" },
	},
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		completion = cmp_window.bordered(),
		documentation = cmp_window.bordered(),
	},

	-- window = {
	-- 	completion = { -- rounded border; thin-style scrollbar
	-- 		border = 'rounded',
	-- 		scrollbar = '║',
	-- 	},
	-- 	documentation = { -- no border; native-style scrollbar
	-- 		border = nil,
	-- 		scrollbar = '',
	-- 	},
	-- },
	formatting = {
		fields = { "abbr", "menu", "kind" },
		max_width = 0,
		kind_icons = ideconfig.icons.kind,
		source_names = {
			buffer = "[Buffer]",
			calc = "[Calc]",
			cmp_tabnine = "[Tabnine]",
			emoji = "[Emoji]",
			luasnip = "[Snippet]",
			nvim_lsp = "[LSP]",
			path = "[Path]",
			snippy = "[Snippy]",
			tmux = "[TMUX]",
			treesitter = "[TreeSitter]",
			ultisnips = "[Ultisnips]",
			vsnip = "[Snippet]",
		},
		format = lspkind.cmp_format({
			mode = "default",   -- show only symbol annotations
			maxwidth = 50,      -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
			before = function(entry, item)
				item.menu = ({
					buffer = "[Buffer]",
					calc = "[Calc]",
					cmp_tabnine = "[Tabnine]",
					emoji = "[Emoji]",
					luasnip = "[Snip]",
					nvim_lsp = "[LSP]",
					nvim_lua = "[API]",
					path = "[Path]",
					rg = "[RG]",
					treesitter = "[TreeSitter]",
					vsnip = "[Snippet]",
				})[entry.source.name]
				return item
			end,
		}),
		-- expand = function(args)
		-- 	luasnip.lsp_expand(args.body)
		-- end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete({}),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
})
