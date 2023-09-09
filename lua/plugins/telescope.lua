return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<Esc>"] = require("telescope.actions").close,
							["<C-h>"] = "which_key",
							["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
							["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({
								postfix = " --iglob ",
							}),
						},
						n = {
							["<C-h>"] = "which_key",
						},
					},
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--trim",
					},
					prompt_prefix = "   ",
				},
				pickers = {
					find_files = {
						find_command = { "fd", "--type", "f", "--hidden", "--strip-cwd-prefix" },
						file_ignore_patterns = { ".git/", ".cache", "%.o" },
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
		end,
		keys = {
			--     -----------------------------------------------------------------------------
			--     -- Find/File
			--     ------------------------------------------------------------------------------
			{ "<leader><space>", "<cmd>Telescope buffers<cr>", desc = "[F]ind [F]iles" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "[F]ind [B]uffers" },
			{ "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "[F]ind [G]it files" },
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "[F]ind [F]iles" },
			{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "[F]ind [K]eymaps" },
			{
				"<leader>fF",
				"<cmd>lua require('telescope.builtin').find_files({cwd='~'})<cr>",
				desc = "[F]ind [F]iles $HOME",
			},
			{ "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "[F]ind [O]pened files" },
			-- { '<leader>fp', "<cmd>lua require'telescope'.extensions.project.project()<cr>", desc = '[F]ind [P]roject' },
			{
				"<leader>fp",
				"<cmd>lua require'telescope'.extensions.projects.projects{}<cr>",
				desc = "[F]ind [P]roject",
			},
			-- { "<leader>fr", "<cmd>Telescope registers<cr>", desc = "[F]ind [R]egister" },
			{ "<leader>ft", "<cmd>Telescope filetypes<cr>", desc = "[F]ind [T]ypes file" },

			--     -----------------------------------------------------------------------------
			--     -- Search
			--     ------------------------------------------------------------------------------
			{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_fin<cr>", desc = "[S]earch in current [B]uffer" },
			{ "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "[S]earch current [W]ord" },
			{ "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "[S]earch by [G]rep" },
			{
				"<leader>sG",
				"<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
				desc = "[S]earch by live [G]rep",
			},
		},
		dependencies = {
			"nvim-telescope/telescope-rg.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-live-grep-args.nvim",
				dependencies = {
					{
						'nvim-telescope/telescope-fzf-native.nvim',
						build = 'make'
					},
				},

				config = function()
					require("telescope").load_extension("fzf")
					require("telescope").load_extension("live_grep_args")
				end,
			},
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
	},
}
