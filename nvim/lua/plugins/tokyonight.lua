return {
	"folke/tokyonight.nvim",
	priority = 1000,

	opts = {
		style = "night",
		transparent = true,
		styles = {
			sidebars = "transparent",
			floats = "transparent",
		},

		on_colors = function(colors)
			colors.bg_statusline = colors.none
			colors.bg_sidebar = colors.none
			colors.border_highlight = "#709ad2"
		end,
		on_highlights = function(hl, colors)
			hl.CursorLine = { bg = colors.none }
			hl.CursorLineNr = { fg = "#737aa2", bold = true }
			hl.Pmenu = { bg = colors.none }
		end,
	},

	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd.colorscheme("tokyonight")
		vim.api.nvim_set_hl(0, "MatchParen", { link = "IlluminatedWordText" })
	end,
}
