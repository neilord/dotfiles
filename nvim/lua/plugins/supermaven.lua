return {
	"supermaven-inc/supermaven-nvim",
	enabled = false,

	config = function()
		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggestion = "<Right>",
				accept_word = "<Left>",
			},
			disable_inline_completion = false,
		})
	end,
}
