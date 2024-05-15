local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
   vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable',
      lazypath,
   })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
   { import = "plugins" },
   { import = "plugins.lsp" },
},
{
   install = {
      colorscheme = { 'tokyonight' },
   },
   change_detection = {
      notify = false,
   },
   ui = {
      size = {
         width = 0.59, -- value making it looks similar to Telescope window
         height = 0.6
      },
      border = 'rounded',
   },
})

vim.keymap.set('n', '<leader>p', ':Lazy<CR>', { desc = 'Plugins', silent = true })
