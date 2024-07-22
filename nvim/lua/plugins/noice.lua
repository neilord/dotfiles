return {
	"folke/noice.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		{
			"rcarriga/nvim-notify",
			opts = {
				render = "minimal",
			},
		},
	},

	opts = {
		routes = {
			{
				filter = {
					event = "msg_show",
					find = "%d+L, %d+B",
				},
				opts = { skip = true },
			},
			{
				filter = {
					event = "cmdline",
					find = "IncRename",
				},
				opts = { skip = true },
			},
		},
		cmdline = {
			format = {
				search_down = { icon = " " },
				search_up = { icon = " " },
				cmdline = { opts = { position = { row = "85%", col = "50%" } } },
				lua = { opts = { position = { row = "85%", col = "50%" } } },
				help = { opts = { position = { row = "85%", col = "50%" } } },
				input = { opts = { position = { row = "85%", col = "50%" } } },
			},
		},
		lsp = {
			progress = {
				enabled = false,
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		presets = {
			bottom_search = true,
			long_message_to_split = true,
			lsp_doc_border = true,
		},
	},

	config = function(_, opts)
		require("noice").setup(opts)

		vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { link = "FloatBorder" })
		vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitle", { link = "FloatTitle" })
		vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", { link = "FloatTitle" })
		vim.api.nvim_set_hl(0, "NoiceCmdlineIconSearch", { link = "FloatTitle" })

		vim.api.nvim_set_hl(0, "NotifyINFOBorder", { link = "FloatBorder" })
		vim.api.nvim_set_hl(0, "NotifyINFOTitle", { link = "FloatTitle" })
		vim.api.nvim_set_hl(0, "NotifyINFOIcon", { link = "FloatTitle" })
	end,
}
