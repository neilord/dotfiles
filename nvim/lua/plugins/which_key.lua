return {
	"folke/which-key.nvim",
	event = "VeryLazy",

	opts = {
		preset = "modern",
		delay = 1000,
		win = {
			no_overlap = false,
		},
		icons = {
			mappings = false,
		},
		show_help = false,
	},

	config = function(_, opts)
		local which_key = require("which-key")
		which_key.setup(opts)
		which_key.add({
			{ "<leader>b", group = "Buffer" },
			{ "<leader>r", group = "Restart" },
			{ "<leader>a", group = "Animation" },
			{ "<leader>s", group = "Settings" },
		})
	end,
}
