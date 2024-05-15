return {
   'CopilotC-Nvim/CopilotChat.nvim',
   branch = 'canary',
   dependencies = {
      { 'zbirenbaum/copilot.lua' },
      { 'nvim-lua/plenary.nvim' },
   },

   event = 'VeryLazy',

   opts = {
      show_folds = false,
      show_help = false,
      separator = ' ',
      question_header = '# User',
      window = {
         layout = 'float',
         border = 'rounded',
         width = 0.5,
         height = 0.4,
         row = 3,
      }
   },
}
