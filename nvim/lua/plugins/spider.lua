return {
	"chrisgrieser/nvim-spider",

	event = "BufReadPre",

	keys = {
		{
			"w",
			"<cmd>lua require('spider').motion('w')<CR>",
			{ "n", "o", "x" },
		},
		{
			"e",
			"<cmd>lua require('spider').motion('e')<CR>",
			{ "n", "o", "x" },
		},
		{
			"b",
			"<cmd>lua require('spider').motion('b')<CR>",
			{ "n", "o", "x" },
		},
		{
			"ge",
			"<cmd>lua require('spider').motion('ge')<CR>",
			{ "n", "o", "x" },
		},
	},
}
