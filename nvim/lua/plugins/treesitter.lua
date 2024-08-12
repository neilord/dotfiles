return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "RRethy/nvim-treesitter-textsubjects" },
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
				prev_selection = ",",

				keymaps = {
					["."] = "textsubjects-smart",
					[";"] = "textsubjects-container-outer",
					["i;"] = {
						"textsubjects-container-inner",
						desc = "Select inside containers (classes, functions, etc.)",
					},
				},
			},
		})
	end,
}
