return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},

	event = "VeryLazy",

	opts = {
		defaults = {
			file_ignore_patterns = {
				"node_modules",
				"package_lock.json",
			},
			mappings = {
				n = {
					["q"] = require("telescope.actions").close,
				},
			},

			prompt_prefix = "   ",
			selection_caret = " ",

			sorting_strategy = "ascending",
			layout_strategy = "vertical",
			path_display = { "smart" },

			layout_config = {
				width = 0.6,
				height = 0.8,
				preview_cutoff = 40,
				prompt_position = "top",
			},
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	},

	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("fzf")

		vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { link = "TelescopePromptBorder" })
		vim.api.nvim_set_hl(0, "TelescopePromptTitle", { link = "TelescopePromptBorder" })
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#9d7cd8" })
	end,

	keys = {
		{ "<leader>f",  "<cmd>Telescope find_files<CR>", desc = "Find Files" },
		{ "<leader>F",  "<cmd>Telescope live_grep<CR>",  desc = "Find Text" },
		{ "<leader>sh", "<cmd>Telescope highlights<CR>", desc = "Highlights" },
	},
}
