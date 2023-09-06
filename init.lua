--  WARN: The leader must be define here, it's used for other plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Core (Load plugins)
require("core.plugins_manager")

-- Configuration
require("config.options")
require("config.keymaps")

-- Init some plugins
require("core.autocmds")
require("core.completion")
require("core.lsp")
