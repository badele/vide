-- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
-- test
return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"jonahgoldwastaken/copilot-status.nvim",
		"SmiteshP/nvim-navic",

	},
	opts = function()
		local icons = require("config.icons")

		local copilot_status = function()
			return require("copilot_status").status_string()
		end

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
							error = icons.diagnostics.Error,
							warn = icons.diagnostics.Warn,
							info = icons.diagnostics.Info,
							hint = icons.diagnostics.Hint,
						},
					},
					{
						'fileformat',
						symbols = {
							unix = '', -- e712
							dos = '', -- e70f
							mac = '', -- e711
						}
					},
					{ "encoding" },
					{
						"filename",
						path = 1,
						symbols = { modified = " 󱇧 ", readonly = " 󰈡 ", unnamed = "[No Name]", }
					},
					{
						function() return require("nvim-navic").get_location() end,
						cond = function()
							return package.loaded["nvim-navic"] and
									require("nvim-navic").is_available()
						end,
					},
				},

				lualine_x = {
					{ "filetype" },
					copilot_status,
					{
						function() return require("noice").api.status.command.get() end,
						cond = function()
							return package.loaded["noice"] and
									require("noice").api.status.command.has()
						end,
						-- color = Util.fg("Statement"),
					},
					{
						function() return require("noice").api.status.mode.get() end,
						cond = function()
							return package.loaded["noice"] and
									require("noice").api.status.mode.has()
						end,
						-- color = Util.fg("Constant"),
					},
					{
						function() return "  " .. require("dap").status() end,
						cond = function()
							return package.loaded["dap"] and
									require("dap").status() ~= ""
						end,
						-- color = Util.fg("Debug"),
					},
					-- { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = Util.fg("Special") },
					{
						"diff",
						symbols = {
							added = icons.git.added,
							modified = icons.git.modified,
							removed = icons.git.removed,
						},
					},
				},

				lualine_y = {
					{
						"progress",
						separator = " ",
						padding = { left = 1, right = 0 }
					},
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
	-- config = function(opts)
	-- 	require("lualine").setup(opts)
	-- end,
}
