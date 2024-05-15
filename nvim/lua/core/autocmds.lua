vim.api.nvim_create_autocmd('BufEnter', {
   pattern = { '*.lua' },
   callback = function()
      -- vim.opt.tabstop = 3
      -- vim.opt.softtabstop = 3
      -- vim.opt.shiftwidth = 3
   end
})
