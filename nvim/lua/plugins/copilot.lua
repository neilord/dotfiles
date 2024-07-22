return {
	"zbirenbaum/copilot.lua",
	event = "VeryLazy",
	enabled = false,

	opts = {
		suggestion = {
			auto_trigger = true,
			keymap = {
				accept = "<Right>",
				accept_line = "<S-Right>",
				next = "<S-Down>",
				prev = "<S-Up>",
				dismiss = "<S-Left>",
			},
		},
		filetypes = {
			["*"] = function()
				if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
					return false
				end
				return true
			end,
		},
	},
}
