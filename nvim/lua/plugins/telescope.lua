local find_files = function()
	local utils = require("telescope.utils")
	local builtin = require("telescope.builtin")

	local is_git_repo = utils.get_os_command_output({
		"git",
		"rev-parse",
		"--is-inside-work-tree",
	})[1] == "true"

	if is_git_repo then
		builtin.git_files()
	else
		builtin.find_files()
	end
end

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},

	event = "VeryLazy",

	config = function()
		local telescope = require("telescope")

		telescope.setup({
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
		})

		telescope.load_extension("fzf")

		vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { link = "TelescopePromptBorder" })
		vim.api.nvim_set_hl(0, "TelescopeSelection", { link = "PmenuSel" })
	end,

	keys = {
		{ "<leader>f", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
		{ "<leader>F", "<cmd>Telescope live_grep<CR>", desc = "Find Text" },
		{ "<leader>sh", "<cmd>Telescope highlights<CR>", desc = "Highlights" },
	},
}
