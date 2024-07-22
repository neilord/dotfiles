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
			dashboard.button("n", "  New File", ":new<BAR>startinsert<CR>"),
			dashboard.button("f", "  Find File", ':lua=require("telescope.builtin").find_files()<CR>'),
			dashboard.button("t", "󰊄  Find Text", ':lua=require("telescope.builtin").live_grep()<CR>'),
			dashboard.button("r", "  Recent Files", ':lua=require("telescope.builtin").oldfiles()<CR>'),
			dashboard.button("p", "  Plugins", ":Lazy<CR>"),
			dashboard.button("s", "  Settings", ":e $MYVIMRC | :cd %:p:h | vsplit .<CR>"),
			dashboard.button("q", "  Quit", ":qa<CR>"),
		}

		require("alpha").setup(dashboard.config)

		vim.keymap.set("n", "<leader>d", ":Alpha<CR>", { silent = true, desc = "Dashboard" })
	end,
}
