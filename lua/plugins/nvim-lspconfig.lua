return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "SmiteshP/nvim-navic" },
  },
  config = function()
    -- Setup language servers.
    local lspconfig = require('lspconfig')
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    lspconfig.bashls.setup {}

    lspconfig.dockerls.setup {}

    lspconfig.nixd.setup {}        -- nix
    lspconfig.nil_ls.setup {}      -- nix
    lspconfig.rnix.setup {}        -- nix

    lspconfig.marksman.setup {}    -- markdown

    lspconfig.pyright.setup {}     -- python
    lspconfig.ruff_lsp.setup {}    -- python

    lspconfig.metals.setup {}      -- scala

    lspconfig.terraformls.setup {} -- terraform

    -- Deno
    vim.g.markdown_fenced_languages = {
      "ts=typescript"
    }
    lspconfig.denols.setup {
      deno = {
        enable = true,
        suggest = {
          imports = {
            hosts = {
              ["https://crux.land"] = true,
              ["https://deno.land"] = true,
              ["https://x.nest.land"] = true
            }
          }
        }
      }
    }

    -- EFM engine language server
    lspconfig.efm.setup {
      init_options = { documentFormatting = true },
      -- cmd = { "efm-langserver", "-loglevel", "5", "-logfile", "/tmp/efm.log", "-c",
      cmd = { "efm-langserver", "-c",
        vim.loop.cwd() .. "/.efm-langserver.yaml" },
      filetypes = { 'json', 'yaml' }
    }

    -- JSON
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    require 'lspconfig'.jsonls.setup {
      capabilities = capabilities,
      cmd = { "vscode-json-languageserver", "--stdio" }
    }

    -- Lua
    lspconfig.lua_ls.setup {

      on_init = function(client)
        local path = client.workspace_folders[1].name
        if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
          client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
            Lua = {
              runtime = {
                version = 'LuaJIT'
              },
              -- Make the server aware of Neovim runtime files
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME
                  -- "${3rd}/luv/library"
                  -- "${3rd}/busted/library",
                }
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                -- library = vim.api.nvim_get_runtime_file("", true)
              }
            }
          })
          client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        end
        return true
      end
    }

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = require('core.lsp_on_attach')
    }
    )
  end,
}
