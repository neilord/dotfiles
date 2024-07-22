return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		vim.opt.termguicolors = true
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-tree").setup({
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							default = "󰉋",
							open = "󰝰",
							empty = "",
							empty_open = "",
						},
					},
				},
			},
			filters = {
				git_ignored = false,
			},
		})

		vim.api.nvim_set_keymap(
			"n",
			"<leader>e",
			"<cmd>UndotreeHide<CR><cmd>NvimTreeToggle<CR>",
			{ desc = "Explorer", silent = true }
		)
		vim.api.nvim_set_keymap("n", "<leader>E", "<cmd>UndotreeHide<CR><cmd>NvimTreeFindFile<CR>", { silent = true })
	end,
}
