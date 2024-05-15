return {
   "williamboman/mason.nvim",
   dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
   },

   event = 'VeryLazy',

   config = function()
      require('mason').setup({
         ui = {
            border = 'rounded',
            width = 0.58, -- value making it looks similar to Lazy window
            height = 0.6,
            -- icons = {
            --    package_installed = "✓",
            --    package_pending = "➜",
            --    package_uninstalled = "✗",
            -- },
         },
      })

      require("mason-lspconfig").setup({
         -- ensure_installed = {
         --    "tsserver",
         --    "html",
         --    "cssls",
         --    "tailwindcss",
         --    "svelte",
         --    "lua_ls",
         --    "graphql",
         --    "emmet_ls",
         --    "prismals",
         --    "pyright",
         -- },
      })

      require("mason-tool-installer").setup({
         -- ensure_installed = {
         --    "prettier",
         --    "stylua",
         --    "isort",
         --    "black",
         --    "pylint",
         --    "eslint_d",
         -- },
      })
   end,
}
