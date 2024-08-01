return {
   "mbbill/undotree",

   event = "VeryLazy",

   config = function()
      vim.g.undotree_HelpLine = 0
   end,

   keys = {
      {
         "<leader>u",
         "<cmd>Neotree close<CR><cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>",
         desc = "Undo History",
         silent = true,
      },
   },
}
