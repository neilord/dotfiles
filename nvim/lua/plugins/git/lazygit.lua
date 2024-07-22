return {
	"kdheepak/lazygit.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	event = "VeryLazy",

	keys = {
		{ "<leader>g", "<CMD>LazyGit<CR>" },
		{ "<leader>G", "<CMD>LazyGitFilter<CR>" },
	},
}
