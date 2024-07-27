return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"echasnovski/mini.icons",
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim",
		{
			"s1n7ax/nvim-window-picker",
			version = "2.*",
			config = function()
				require("window-picker").setup({
					filter_rules = {
						include_current_win = false,
						autoselect_one = true,
						bo = {
							filetype = { "neo-tree", "neo-tree-popup", "notify" },
							buftype = { "terminal", "quickfix" },
						},
					},
				})
			end,
		},
	},

	opts = {
		enable_modified_markers = false,
		popup_border_style = "rounded",
		sort_case_insensitive = true,
		default_component_configs = {
			icon = {
				folder_closed = "󰉋",
				folder_open = "󰝰",
				folder_empty = "󰉖",
				folder_empty_open = "󰷏",
			},
			diagnostics = {
				symbols = {
					hint = "󰌵",
					info = "󰋼",
					warn = "",
					error = "󰅙",
				},
			},
		},
		window = {
			width = 30,
		},
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = false,
				never_show = {
					".DS_Store",
				},
			},
			scan_mode = "deep",
		},
	},

	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer" },
		{ "<leader>E", "<cmd>Neotree focus<cr>", desc = "Explorer" },
	},
}
