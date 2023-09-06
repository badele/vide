return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"nvim-telescope/telescope.nvim", -- optional
		"sindrets/diffview.nvim", -- optional
		"ibhagwan/fzf-lua", -- optional
	},
	opts = {
		disable_insert_on_commit = false,
		kind = "replace",
		sections = {
			recent = {
				folded = false,
				hidden = false,
			},
		},
		mappings = {
			finder = {
				["<cr>"] = "Select",
				["<c-c>"] = "Close",
				["<esc>"] = "Close",
				["<c-n>"] = "Next",
				["<c-p>"] = "Previous",
				["<down>"] = "Next",
				["<up>"] = "Previous",
				["<tab>"] = "MultiselectToggleNext",
				["<s-tab>"] = "MultiselectTogglePrevious",
				["<c-j>"] = "NOP",
			},
			-- Setting any of these to `false` will disable the mapping.
			status = {
				["q"] = "Close",
				["I"] = "InitRepo",
				["1"] = "Depth1",
				["2"] = "Depth2",
				["3"] = "Depth3",
				["4"] = "Depth4",
				["<tab>"] = "Toggle",
				["x"] = "Discard",
				["s"] = "Stage",
				["S"] = "StageUnstaged",
				["<c-s>"] = "StageAll",
				["u"] = "Unstage",
				["U"] = "UnstageStaged",
				["d"] = "DiffAtFile",
				["$"] = "CommandHistory",
				["#"] = "Console",
				["<c-r>"] = "RefreshBuffer",
				["<enter>"] = "GoToFile",
				["<c-v>"] = "VSplitOpen",
				["<c-x>"] = "SplitOpen",
				["<c-t>"] = "TabOpen",
				["?"] = "HelpPopup",
				["D"] = "DiffPopup",
				["p"] = "PullPopup",
				["r"] = "RebasePopup",
				["m"] = "MergePopup",
				["P"] = "PushPopup",
				["c"] = false, -- please use the <C-t> and commit command
				["l"] = "LogPopup",
				["v"] = "RevertPopup",
				["Z"] = "StashPopup",
				["A"] = "CherryPickPopup",
				["b"] = "BranchPopup",
				["f"] = "FetchPopup",
				["X"] = "ResetPopup",
				["M"] = "RemotePopup",
				["{"] = "GoToPreviousHunkHeader",
				["}"] = "GoToNextHunkHeader",
			},
		},
	},
}
