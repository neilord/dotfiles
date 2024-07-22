return {
   "lukas-reineke/indent-blankline.nvim",
   dependencies = {
      "hiphish/rainbow-delimiters.nvim", -- not a direct dependency, but have to be loaded before
   },
   event = "BufReadPre",

   config = function()
      local highlight = {
         "IndentBlankline1",
         "IndentBlankline2",
         "IndentBlankline3",
         "IndentBlankline4",
         "IndentBlankline5",
         "IndentBlankline6",
      }

      vim.api.nvim_set_hl(0, "IndentBlankline1", { fg = "#353E5B" })
      vim.api.nvim_set_hl(0, "IndentBlankline2", { fg = "#384A5D" })
      vim.api.nvim_set_hl(0, "IndentBlankline3", { fg = "#403A58" })
      vim.api.nvim_set_hl(0, "IndentBlankline4", { fg = "#2C4755" })
      vim.api.nvim_set_hl(0, "IndentBlankline5", { fg = "#3C4738" })
      vim.api.nvim_set_hl(0, "IndentBlankline6", { fg = "#4D4339" })

      require("ibl").setup({
         indent = {
            char = "▏",
            highlight = highlight,
         },
         scope = {
            char = "▏",
            show_start = false,
            show_end = false,
            highlight = vim.g.rainbow_delimiters_highlight,
         },
      })

      -- set bright colors for rainbow delimiters, since rainbow delimiters
      -- was loaded with dim color for indent blankline scope indent highlight
      vim.api.nvim_set_hl(0, "RainbowDelimiter1", { fg = "#698cd6" })
      vim.api.nvim_set_hl(0, "RainbowDelimiter2", { fg = "#68b3de" })
      vim.api.nvim_set_hl(0, "RainbowDelimiter3", { fg = "#9a7ecc" })
      vim.api.nvim_set_hl(0, "RainbowDelimiter4", { fg = "#25aac2" })
      vim.api.nvim_set_hl(0, "RainbowDelimiter5", { fg = "#80a856" })
      vim.api.nvim_set_hl(0, "RainbowDelimiter6", { fg = "#c49a5a" })

      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
   end,
}
