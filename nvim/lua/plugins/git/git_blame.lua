return {
	"f-person/git-blame.nvim",
	event = "VeryLazy",

	opts = {
		message_template = "  <summary> • <date> • <author> • <<sha>>",
		message_when_not_committed = "",
		highlight_group = "Comment",
		delay = 0,
		set_extmark_options = {
			priority = 9999,
		},
		display_virtual_text = 0,
	},

	keys = {
		{
			"<leader>Gb",
			"<cmd>let g:gitblame_display_virtual_text = 1 - g:gitblame_display_virtual_text<cr><cmd>GitBlameToggle<cr><cmd>GitBlameToggle<cr>",
			desc = "Toggle git blame",
		},
		{
			"<leader>GB",
			"<cmd>GitBlameCopySHA<cr>",
			desc = "Copy git blame sha",
		},
	},
}
