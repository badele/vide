return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	opts = function()
		local ideconfig = require("custom.ideconfig")
		-- local Util = require("lazyvim.util")

		return {
			options = {
				theme = "auto",
				icons_enabled = true,
				globalstatus = true,
				disabled_filetypes = { statusline = { "dashboard", "alpha" } },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = {
					{
						"diagnostics",
						symbols = {
							error = ideconfig.icons.diagnostics.Error,
							warn = ideconfig.icons.diagnostics.Warn,
							info = ideconfig.icons.diagnostics.Info,
							hint = ideconfig.icons.diagnostics.Hint,
						},
					},
					{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
					{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
          -- stylua: ignore
          {
            function() return require("nvim-navic").get_location() end,
            cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
          },
				},
				lualine_x = {
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            -- color = Util.fg("Statement"),
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            -- color = Util.fg("Constant"),
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
            -- color = Util.fg("Debug"),
          },
					-- { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = Util.fg("Special") },
					{
						"diff",
						symbols = {
							added = ideconfig.icons.git.added,
							modified = ideconfig.icons.git.modified,
							removed = ideconfig.icons.git.removed,
						},
					},
				},
				lualine_y = {
					{ "progress", separator = " ", padding = { left = 1, right = 0 } },
					{ "location", padding = { left = 0, right = 1 } },
				},
				lualine_z = {
					function()
						return " " .. os.date("%R")
					end,
				},
			},
			extensions = { "neo-tree", "lazy" },
		}
	end,
	config = function()
		require("lualine").setup(opts)
	end,
}
