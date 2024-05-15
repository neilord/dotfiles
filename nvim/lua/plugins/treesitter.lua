return {
   'nvim-treesitter/nvim-treesitter',
   build = ':TSUpdate',

   event = 'VeryLazy',

   opts = {
      sync_install = false,
      ensure_installed = 'all',
      highlight = { enable = true },
      indent = { enable = true },
   },

   config = true,
}
