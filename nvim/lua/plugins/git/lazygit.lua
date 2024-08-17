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

	config = function()
		vim.g.lazygit_floating_window_scaling_factor = 0.8
		vim.api.nvim_set_hl(0, "LazyGitBorder", { fg = "#709ad2" })
	end,
}
