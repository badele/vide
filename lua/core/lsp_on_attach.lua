local map = function(modes, keys, func, desc, opts)
  vim.keymap.set(modes, keys, func, { buffer = opts.buffer, desc = desc })
end

local function on_attach(_, bufnr)
  local capabilities = vim.lsp.get_active_clients()[1].server_capabilities
  -- vim.print(capabilities)

  local opts = { buffer = bufnr }

  map({ "n" }, "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", opts)
  map({ "n" }, "<leader>ch", vim.lsp.buf.hover, "[C]ode [H]over", opts)
  map({ "n" }, "<leader>cf", function()
    vim.lsp.buf.format { async = true }
  end, "[C]ode [F]ormat", opts)
  map({ "n" }, "<leader>cr", vim.lsp.buf.rename, "[C]ode [R]ename", opts)
  map({ "n" }, "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration", opts)
  map({ "n" }, "gd", vim.lsp.buf.definition, "[G]oto [D]efinition", opts)
  map({ "n" }, "gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation", opts)
  map({ "n" }, "gr", vim.lsp.buf.references, "[G]oto [R]eference", opts)
  map({ "n" }, "<C-k", vim.lsp.buf.signature_help, "[C]ode signature", opts)
  map({ "n" }, '<leader>wa', vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd", opts)
  map({ "n" }, '<leader>wr', vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove", opts)
  map({ "n" }, '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "[W]orkspace [L]ist", opts)
  map({ "n" }, "<leader>D", vim.lsp.buf.type_definition, "Definition", opts)
end

return on_attach
