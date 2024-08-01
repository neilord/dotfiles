return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	opts = {
		options = {
			ignore_focus = { "neo-tree", "undotree", "diff", "lazy", "mason", "TelescopePrompt" },
			disabled_filetypes = { "alpha" },
			always_divide_middle = false,
			refresh = { statusline = 100 },
			globalstatus = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				"branch",
				"diff",
				{ "diagnostics", symbols = { hint = "󰌵 ", info = "󰋼 ", warn = " ", error = "󰅙 " } },
			},
			lualine_c = {
				{
					"filename",
					color = { bg = "#15161e" },
					separator = { right = "" },
				},
			},
			lualine_x = {
				{
					"encoding",
					color = { bg = "#15161e" },
					separator = { left = "" },
				},
				{
					function()
						return ""
					end,
					color = { fg = "#a9b1d6", bg = "#15161e" },
					padding = 0,
				},
				{
					"fileformat",
					color = { bg = "#15161e" },
				},
				{
					function()
						return ""
					end,
					color = { fg = "#a9b1d6", bg = "#15161e" },
					padding = 0,
				},
				{
					"filetype",
					color = { bg = "#15161e" },
				},
			},
		},
	},
}
