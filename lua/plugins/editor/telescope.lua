-- Find, Filter, Preview, Pick. All lua, all the time.
return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-treesitter/nvim-treesitter",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{
			"ahmedkhalf/project.nvim",
			lazy = false,
			dependencies = {
				"nvim-telescope/telescope-file-browser.nvim",
			},
			opts = {
				patterns = { ".git", "Makefile" },
			},
			config = function(_, opts)
				require("project_nvim").setup(opts)
				require("telescope").load_extension("projects")
			end,
		},
	},
	config = function()
		local telescope = require("telescope")
		local open_with_trouble = require("trouble.sources.telescope").open

		telescope.setup({
			defaults = {
				file_ignore_patterns = { "node_modules" },
				path_display = { "truncate " },
				sorting_strategy = "ascending",
				mappings = {
					i = { ["<c-t>"] = open_with_trouble },
					n = { ["<c-t>"] = open_with_trouble },
				},
			},
			extensions = {
				fzf = {
					fuzzy = false, -- Search exactly word
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})

		telescope.load_extension("fzf")
	end,
	keys = {
		{ "<leader><space>", "<cmd>Telescope buffers<cr>",                  desc = "Find buffers" },
		{ "<leader>fD",      "<cmd>Telescope diagnostics<cr>",              desc = "Find diagnostics" },
		{ "<leader>fa",      "<cmd>Telescope autocommands<cr>",             desc = "Find autocommands" },
		{ "<leader>fc",      "<cmd>Telescope commands<cr>",                 desc = "Find commands" },
		{ "<leader>fd",      "<cmd>Telescope diagnostics bufnr=0<cr>",      desc = "Find diagnostics" },
		{ "<leader>ff",      "<cmd>Telescope find_files<cr>",               desc = "Find files" },
		{ "<leader>fh",      "<cmd>Telescope command_history<cr>",          desc = "Find command history" },
		{ "<leader>fk",      "<cmd>Telescope keymaps<cr>",                  desc = "Find keymaps" },
		{ "<leader>fo",      "<cmd>Telescope oldfiles<cr>",                 desc = "Find old files" },
		{ "<leader>fp",      "<cmd>Telescope projects<cr>",                 desc = "Find Project" },
		{ "<leader>fr",      "<cmd>Telescope registers<cr>",                desc = "Find registers" },
		{ "<leader>ft",      "<cmd>Telescope filetypes<cr>",                desc = "Find types file" },
		{ "<leader>fv",      "<cmd>Telescope vim_options<cr>",              desc = "Find options" },

		-- Search
		-- TODO: fix the telescope current buffer serch function
		{ "<leader>sb",      "<cmd>Telescope current_buffer_fuzzy_fin<cr>", desc = "Search in current Buffer" },
		{ "<leader>sg",      "<cmd>Telescope live_grep<cr>",                desc = "Search grep files" },
		{ "<leader>sw",      "<cmd>Telescope grep_string<cr>",              desc = "Search current Word" },

		-- git
		{ "<leader>fgb",     "<cmd>Telescope git_branchs<cr>",              desc = "Find git branchs" },
		{ "<leader>fgc",     "<cmd>Telescope git_commits<cr>",              desc = "Find git commits" },
		{ "<leader>fgf",     "<cmd>Telescope git_files<cr>",                desc = "Find git files" },
		{ "<leader>fgs",     "<cmd>Telescope git_status<cr>",               desc = "Find git status" },

		{
			"<leader>fF",
			function()
				require("telescope.builtin").find_files({ cwd = "~" })
			end,
			desc = "Find $HOME files",
		},
	},
}
