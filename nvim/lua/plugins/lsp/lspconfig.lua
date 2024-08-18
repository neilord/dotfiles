return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "williamboman/mason-lspconfig.nvim", config = true },

		-- general actions
		"aznhe21/actions-preview.nvim",
		{
			"antosha417/nvim-lsp-file-operations",
			dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-tree.lua" },
			config = true,
		},
		{
			"smjonas/inc-rename.nvim",
			opts = {
				input_buffer_type = "dressing",
			},
		},

		-- specific language servers
		{ "folke/neodev.nvim",                 config = true },
		{
			"pmizio/typescript-tools.nvim",
			dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
			config = true,
		},
		{
			"mrcjkb/rustaceanvim",
			version = "^4",
		},
	},
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		require("lspconfig.ui.windows").default_options.border = "rounded"

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true, nowait = true }

				vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
				vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)
				vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", opts)

				opts.desc = "See available code actions"
				vim.keymap.set({ "n", "v" }, "<leader>ca", require("actions-preview").code_actions, opts)

				opts.desc = "Smart rename"
				vim.keymap.set("n", "<leader>rn", ":IncRename ", opts)

				opts.desc = "Show buffer diagnostics"
				vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<cr>", opts)

				opts.desc = "Show line diagnostics"
				vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "LSP"
				vim.keymap.set("n", "<leader>rl", ":LspRestart<cr>", opts)
			end,
		})

		-- configure diagnostics
		vim.diagnostic.config({
			severity_sort = true,
			virtual_text = { prefix = "●" },
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.INFO] = "",
					[vim.diagnostic.severity.HINT] = "",
				},
				numhl = {
					[vim.diagnostic.severity.ERROR] = "DiagnosticError",
					[vim.diagnostic.severity.WARN] = "DiagnosticWarn",
					[vim.diagnostic.severity.INFO] = "DiagnosticInfo",
					[vim.diagnostic.severity.HINT] = "DiagnosticHint",
				},
			},
			float = {
				focusable = true,
				border = "rounded",
				header = "",
				prefix = "",
				suffix = function(diagnostic)
					return " " .. (diagnostic.source or "") .. "(" .. (diagnostic.code or "") .. ")",
						"DiagnosticUnnecessary"
				end,
			},
		})

		vim.cmd("highlight DiagnosticVirtualTextError guibg=nil")
		vim.cmd("highlight DiagnosticVirtualTextWarn guibg=nil")
		vim.cmd("highlight DiagnosticVirtualTextInfo guibg=nil")
		vim.cmd("highlight DiagnosticVirtualTextHint guibg=nil")

		-- configure language servers
		local capabilities = cmp_nvim_lsp.default_capabilities()

		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["rust_analyzer"] = function()
				vim.g.rustaceanvim = {
					server = {
						on_attach = function()
							vim.lsp.inlay_hint.enable(true)
							vim.cmd("highlight LspInlayHint guibg=none")
						end,
					},
				}
			end,
			["typos_lsp"] = function()
				require("lspconfig").typos_lsp.setup({
					init_options = {
						diagnosticSeverity = "Info",
					},
				})
			end,
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})
	end,
}
