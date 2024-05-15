return {
   "folke/which-key.nvim",

   event = "VeryLazy",

   config = function()
      vim.opt.timeoutlen = 1000

      local which_key = require('which-key')

      which_key.setup({
         window = {
            border = 'rounded',
         },
         layout = {
            align = "center",
         },
         show_help = false,
         triggers_nowait = {
            '"',
            "<c-r>",
            "z=",
         },
      })

      which_key.register({
         f = { name = "Find" },
         b = { name = "Buffer" },
         r = { name = "Restart" },
      }, { prefix = "<leader>" })
   end,
}
