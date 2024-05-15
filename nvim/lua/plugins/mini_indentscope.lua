return {
   'echasnovski/mini.indentscope',

   version = false,

   config = function()
      local indentscope = require('mini.indentscope')
      indentscope.setup({
         symbol = '▏',
         draw = {
            delay = 0,
            animation = indentscope.gen_animation.none()
         },
      })

      vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', { link = 'Normal' })

      vim.api.nvim_create_autocmd('BufEnter', {
         callback = function()
            local disabled = true
            if vim.bo.filetype ~= '' and
               vim.bo.filetype ~= 'markdown' and
               vim.bo.filetype ~= 'help' and
               vim.bo.filetype ~= 'alpha' and
               vim.bo.filetype ~= 'NvimTree'
            then
               disabled = false
            end
            vim.b.miniindentscope_disable = disabled
         end
      })
   end,
}
