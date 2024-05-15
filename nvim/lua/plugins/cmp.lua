return {
   'hrsh7th/nvim-cmp',
   event = 'InsertEnter',
   dependencies = {
      { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
      'hrsh7th/cmp-buffer',
      -- 'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      -- "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      -- "onsails/lspkind.nvim",
      'hiphish/rainbow-delimiters.nvim',
      'folke/tokyonight.nvim',


      'windwp/nvim-autopairs',
   },

   init = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      -- local lspkind = require("lspkind")

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
         window = {
            documentation = {
               border = "rounded",
            },
            completion = {
               border = "rounded",
            },
         },
         completion = {
            completeopt = "menu,menuone,preview,noselect",
         },
         snippet = {
            expand = function(args)
               luasnip.lsp_expand(args.body)
            end,
         },

         mapping = cmp.mapping.preset.insert({
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
         }),
         sources = cmp.config.sources({
            { name = "nvim_lsp"},
            { name = "luasnip" },
            { name = "buffer" },
            { name = "path" },
         }),

         -- configure lspkind for vs-code like pictograms in completion menu
         -- formatting = {
         --    format = lspkind.cmp_format({
         --       maxwidth = 50,
         --       ellipsis_char = "...",
         --    }),
         -- },
      })
      vim.api.nvim_set_hl(0, 'Pmenu', { bg = nil })
   end,
}
