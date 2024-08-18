local header = {
	"",
	"",
	"",
	"",
	"",
	"                                                                       ",
	"                                                                     ",
	"       ████ ██████           █████      ██                     ",
	"      ███████████             █████                             ",
	"      █████████ ███████████████████ ███   ███████████   ",
	"     █████████  ███    █████████████ █████ ██████████████   ",
	"    █████████ ██████████ █████████ █████ █████ ████ █████   ",
	"  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
	" ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
	"",
}

-- Alpha noice
return {
	"goolord/alpha-nvim",

	config = function()
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = header
		dashboard.section.header.opts.hl = "AlphaHeader"
		vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#709ad2" })

		dashboard.section.buttons.val = {
			dashboard.button("n", "  New File", "<cmd>enew<cr>i"),
			dashboard.button("f", "  Find File", '<cmd>lua=require("telescope.builtin").find_files()<cr>'),
			dashboard.button("t", "󰊄  Find Text", '<cmd>lua=require("telescope.builtin").live_grep()<cr>'),
			dashboard.button("r", "  Recent Files", '<cmd>lua=require("telescope.builtin").oldfiles()<cr>'),
			dashboard.button("p", "  Plugins", "<cmd>Lazy<cr>"),
			dashboard.button("s", "  Settings", "<cmd>e $MYVIMRC | Neotree<cr>"),
			dashboard.button("q", "  Quit", "<cmd>qa<cr>"),
		}

		require("alpha").setup(dashboard.config)

		vim.keymap.set("n", "<leader>d", "<cmd>Alpha<cr>", { silent = true, desc = "Dashboard" })
	end,
}
