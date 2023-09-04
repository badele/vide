local ideconfig = require("custom.ideconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

require("luasnip.loaders.from_vscode").lazy_load()
luasnip.config.setup({})

cmp.setup({
	sources = {
		{ name = "buffer" },
		{ name = "calc" },
		{ name = "cmp_tabnine" },
		{ name = "emoji" },
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "treesitter" },
	},
	formatting = {
		fields = { "abbr", "menu", "kind" },
		max_width = 0,
		kind_icons = ideconfig.icons.kind,
		source_names = {
			nvim_lsp = "(LSP)",
			emoji = "(Emoji)",
			path = "(Path)",
			calc = "(Calc)",
			cmp_tabnine = "(Tabnine)",
			vsnip = "(Snippet)",
			luasnip = "(Snippet)",
			buffer = "(Buffer)",
			tmux = "(TMUX)",
			copilot = "(Copilot)",
			treesitter = "(TreeSitter)",
		},
		format = lspkind.cmp_format({
			mode = "default", -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
			symbol_map = { Copilot = "" },
			before = function(entry, item)
				item.menu = ({
					buffer = "[Buffer]",
					luasnip = "[Snip]",
					nvim_lsp = "[LSP]",
					nvim_lua = "[API]",
					path = "[Path]",
					rg = "[RG]",
					copilot = "[Copilot]",

					emoji = "(Emoji)",
					calc = "(Calc)",
					cmp_tabnine = "(Tabnine)",
					vsnip = "(Snippet)",
					tmux = "(TMUX)",
					treesitter = "(TreeSitter)",
				})[entry.source.name]
				return item
			end,
		}),
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
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
