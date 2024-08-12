return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = "all",
			highlight = { enable = true },
			indent = { enable = true },
			matchup = { enable = true },
		})
	end,
}
