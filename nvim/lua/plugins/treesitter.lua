return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",

	event = { "BufReadPre", "BufNewFile" },

	opts = {
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
		matchup = { enable = true },
	},
}
