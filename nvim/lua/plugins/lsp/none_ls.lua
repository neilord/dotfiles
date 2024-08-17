return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvimtools/none-ls-extras.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			border = "rounded",
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,

			sources = {
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.stylua,
				require("none-ls.diagnostics.eslint_d"),
				null_ls.builtins.code_actions.gitsigns,
				null_ls.builtins.code_actions.gitrebase,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>Bf", vim.lsp.buf.format)
	end,
}
