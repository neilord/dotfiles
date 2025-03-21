return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"RRethy/nvim-treesitter-textsubjects",
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = "all",
			highlight = { enable = true },
			indent = { enable = true },
			matchup = { enable = true },

			textsubjects = {
				enable = true,
				prev_selection = ";",

				keymaps = {
					["v"] = "textsubjects-smart",
					["."] = "textsubjects-container-outer",
					["i."] = {
						"textsubjects-container-inner",
						desc = "select inside containers (classes, functions, etc.)",
					},
				},
			},
		})
	end,
}
