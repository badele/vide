local map = function(modes, keys, func, desc, opts)
  vim.keymap.set(modes, keys, func, { buffer = opts.buffer, desc = desc })
end

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

    -- Nix
    lspconfig.nixd.setup {}
    lspconfig.nil_ls.setup {}
    lspconfig.rnix.setup {}

    lspconfig.marksman.setup {}
    lspconfig.pyright.setup {}

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

    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local capabilities = vim.lsp.get_active_clients()[1].server_capabilities
        -- vim.print(capabilities)

        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }

        -- Available capabilities provider
        -- codeActionProvider
        -- completionProvider
        -- definitionProvider
        -- documentSymbolProvider
        -- hoverProvider
        -- referencesProvider
        -- renameProvider
        -- semanticTokensProvider
        -- workspaceSymbolProvider

        if capabilities.hoverProvider then
          -- map({ "n", "i" }, "<C-k>", vim.lsp.buf.hover, "Code Hover", opts)
          map({ "n", "i" }, "<leader>ch", vim.lsp.buf.hover, "[C]ode [H]over", opts)
        end

        if capabilities.documentFormattingProvider then
          map({ "n", "i" }, "<leader>cf", function()
            vim.lsp.buf.format { async = true }
          end, "[C]ode [F]ormat", opts)
        end

        if capabilities.codeActionProvider then
          map({ "n", "i" }, "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", opts)
        end

        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      end,
    }
    )
  end,
}
