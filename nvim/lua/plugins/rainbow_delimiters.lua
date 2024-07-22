return {
	"hiphish/rainbow-delimiters.nvim",

	event = "BufReadPre",

	config = function()
		local highlight = {
			"RainbowDelimiter1",
			"RainbowDelimiter2",
			"RainbowDelimiter3",
			"RainbowDelimiter4",
			"RainbowDelimiter5",
			"RainbowDelimiter6",
		}

		-- set dim colors for indent blankline scope indent,
		-- color will be changed after indent blankline setup
		vim.api.nvim_set_hl(0, "RainbowDelimiter1", { fg = "#657CBA" })
		vim.api.nvim_set_hl(0, "RainbowDelimiter2", { fg = "#6088A8" })
		vim.api.nvim_set_hl(0, "RainbowDelimiter3", { fg = "#8D78BC" })
		vim.api.nvim_set_hl(0, "RainbowDelimiter4", { fg = "#4B95AB" })
		vim.api.nvim_set_hl(0, "RainbowDelimiter5", { fg = "#7A9459" })
		vim.api.nvim_set_hl(0, "RainbowDelimiter6", { fg = "#A88A5C" })

		vim.g.rainbow_delimiters_highlight = highlight

		require("rainbow-delimiters.setup").setup({
			highlight = highlight,
		})
	end,
}
