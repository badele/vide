-- A faster version of filetype.vim
return {
	{
		"nathom/filetype.nvim",
		opts = {
			overrides = {
				extensions = {
					plt = "gnuplot",
					sql = "sql",
					sh = "sh",
					tf = "terraform",
					justfile = "just",
					scad = "openscad",
					tex = "tex",
				},
			},
		},
	},
}
