-- A completion plugin for neovim coded in Lua.
-- https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-path",
    "onsails/lspkind.nvim",
    "rafamadriz/friendly-snippets",
    "saadparwaiz1/cmp_luasnip",
    "zbirenbaum/copilot-cmp"
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    local cmp_window = require "cmp.config.window"
    local icons = require "config.icons"

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      sources = cmp.config.sources({
        { name = "copilot" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "treesitter" },
        { name = "path" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "calc" },
        { name = "emoji" },
      }),

      formatting = {
        fields = { "abbr", "menu", "kind" },
        max_width = 0,
        -- kind_icons = icons.kind,
        source_names = {
          buffer = "(Buffer)",
          calc = "(Calc)",
          cmp_tabnine = "(Tabnine)",
          copilot = "(Copilot)",
          emoji = "(Emoji)",
          luasnip = "(Snippet)",
          nvim_lsp = "(LSP)",
          path = "(Path)",
          treesitter = "(TreeSitter)",
          vsnip = "(Snippet)",
        },
        format = lspkind.cmp_format({
          symbol_map = { Copilot = icons.kind.Copilot },
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },

      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      window = {
        completion = cmp_window.bordered(),
        documentation = cmp_window.bordered(),
      },
    })
  end,
  keys = {
    { "<leader>ic", "<cmd>CmpStatus<CR>", desc = "Completion info" },
  },
}
