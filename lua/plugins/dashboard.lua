-- NOTE: For deleting all entries, remove the .local/state/<VIMPROFILE>/main.shada file
-- WARN: if you remove main.shada, you lost all marks

-- Made with https://emojicombos.com/
local custom_header = {
	"",
	"⡟⡙⢏⠻⣙⢫⡏⢿⠀⠀⠀⠀⠀⢠⣿⢿⡿⣿⢿⣟⣯⠃⢠⣤⣤⠀⢠⣤⣤⣤⣤⣤⣤⣤⣄⡀⠀⠀⠀ ⢠⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤",
	"⠹⡜⡠⢃⠔⡿⡘⠤⣇⠀⠀⠀⠀⣼⣿⡿⣽⣯⣿⣞⠇⠀⢸⣿⣿⠀⢸⣿⣿⠿⠿⠿⠿⢿⣿⣿⣷⡀⠀ ⢸⣿⣿⠛⠛⠛⠛⠛⠛⠛⠛",
	"⠀⣧⠣⡘⣸⢇⠣⢇⢻⡀⠀⠀⠀⣿⣿⣿⣻⣼⢧⠟⠀⠀⢸⣿⣿⠀⢸⣿⣿⠀⠀⠀⠀⠀⠘⢿⣿⣿⡀ ⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀",
	"⠀⠘⡧⣐⡿⢨⡑⠎⡌⠇⠀⠀⣸⣿⣿⣻⣟⣾⣯⠃⠀⠀⢸⣿⣿⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠘⣿⣿⣧ ⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠱⣼⢡⢃⡜⡱⢌⣹⠀⢀⣿⣿⡿⣿⣿⣳⡎⠀⠀⠀⢸⣿⣿⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿ ⢸⣿⣿⣶⣶⣶⣶⣶⣶⣶⣶",
	"⠀⠀⠀⢷⢊⡔⢢⡑⢎⡰⡇⣸⣿⣿⣿⢿⣻⡷⠀⠀⠀⠀⢸⣿⣿⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿ ⢸⣿⣿⠿⠿⠿⠿⠿⠿⠿⠿",
	"⠀⠀⠀⠸⣇⠸⢁⡸⢆⡱⢹⣿⣿⣿⣾⣿⡿⠇⠀⠀⠀⠀⢸⣿⣿⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⣿⣿⡿ ⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⢹⡈⢧⠘⢦⠱⣋⢍⣿⣿⣟⣿⡝⠀⠀⠀⠀⠀⢸⣿⣿⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⣸⣿⣿⠇ ⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⣟⠤⢋⡬⢓⢬⢊⣼⣿⣿⣯⠀⠀⠀⠀⠀⠀⢸⣿⣿⠀⢸⣿⣿⣤⣤⣤⣤⣤⣾⣿⣿⠏⠀ ⢸⣿⣿⣤⣤⣤⣤⣤⣤⣤⣤",
	"⠀⠀⠀⠀⠀⠘⣎⡱⢌⠇⣎⠎⡴⢿⡿⡅⠀⠀⠀⠀⠀⠀⢸⣿⣿⠀⠸⣿⣿⣿⣿⣿⣿⡿⠿⠛⠁⠀⠀ ⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
	"⠀⠀⠀⠀⠀⠀⠘⠓⠊⠛⠒⠛⠓⠛⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ",
	"",
	"  ⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⠀⠸⣷⢠⡿⣿⢸⣿⣴⣿⠀⠀⣿⢸⡟⢻⣆⢸⣟⣛⠀⢀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀",
	"  ⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠀⠀⢹⣿⠃⣿⢸⡟⠿⢿⠀⠀⣿⢸⣧⣼⠏⢸⣯⣍⠀⠘⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛",
	"",
	"",
}

return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			shortcut_type = "number",
			config = {
				project = {
					enable = false,
					limit = 8,
					action = "Telescope projects",
				},
				header = custom_header,
				shortcut = {
					{
						icon = " ",
						desc = "New file",
						key = "n",
						action = "tabnew",
					},
					{
						desc = " Check",
						group = "@property",
						action = "checkhealth",
						key = "c",
					},
					{
						desc = "󰊳 Lazy",
						group = "@property",
						action = "Lazy",
						key = "l",
					},
					{
						desc = " Mason",
						group = "@property",
						action = "Mason",
						key = "m",
					},
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Files[SPC-SPC]",
						group = "Label",
						action = "Telescope find_files",
						-- key = 'f',
					},
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Projects[SPC-fp]",
						group = "Label",
						action = "Telescope projects",
						-- key = 'r',
					},
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Recent Files[SPC-fo]",
						group = "Label",
						action = "Telescope oldfiles",
						-- key = 'r',
					},
				},
			},
		})
	end,
	keys = {
		{ "<leader>;", "<cmd>Dashboard<cr>", desc = "Dashboard" },
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}
