return {
	"rmagatti/goto-preview",
	event = "BufEnter",

	opts = {
		width = 100,
		border = { "↖", "─", "╮", "│", "╯", "─", "╰", "│" },
		post_open_hook = function(buf)
			vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = buf })
		end,
	},

	keys = {
		{ "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>",     desc = "Go to references" },
		{ "gpD", "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>",    desc = "Go to declaration" },

		{ "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",     desc = "Go to definition" },
		{ "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", desc = "Go to implementation" },
		{
			"gpt",
			"<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
			desc = "Go to type definition",
		},
		{ "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", desc = "Close all previews" },
	},
}
