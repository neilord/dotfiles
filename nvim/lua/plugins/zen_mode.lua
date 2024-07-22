return {
	"folke/zen-mode.nvim",
	dependencies = {
		{
			"folke/twilight.nvim",
			opts = {
				dimming = {
					alpha = 0.0,
					term_bg = "#393C56",
				},
				context = 25,
			},
		},
	},

	opts = {
		window = {
			options = {
				signcolumn = "no",
			},
		},
		plugins = {
			options = {
				enabled = true,
				laststatus = 0,
			},
			twilight = { enabled = true },
			gitsigns = { enabled = false },
			tmux = { enabled = true },
		},
	},

	config = function(_, opts)
		local zen_mode = require("zen-mode")
		zen_mode.setup(opts)

		vim.api.nvim_set_keymap("n", "<leader>z", "<cmd>ZenMode<CR>", { desc = "Zen Mode" })

		vim.api.nvim_create_autocmd("VimLeavePre", {
			callback = function()
				zen_mode.close()
			end,
		})
	end,
}
