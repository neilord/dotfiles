vim.g.mapleader = ' '

vim.keymap.set('n', 'U', vim.cmd.redo)

vim.keymap.set('n', 'n', 'nzzzv');
vim.keymap.set('n', 'N', 'Nzzzv');

vim.keymap.set('x', '<leader>p', '"_dP')
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y')
vim.keymap.set({'n', 'v'}, '<leader>Y', '"+Y')
vim.keymap.set({'n', 'v'}, '<leader>d', '"+d')
vim.keymap.set({'n', 'v'}, '<leader>D', '"+D')

vim.keymap.set('v', '<S-Down>', ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set('v', '<S-Up>', ":m '<-2<CR>gv=gv", { silent = true })

vim.keymap.set('n', '<leader>q', ':qa<CR>', { desc = 'Quit', silent = true })
vim.keymap.set('n', '<leader>sc', ':e $MYVIMRC | :cd %:p:h | vsplit .<CR>', { desc = 'Config', silent = true })
vim.keymap.set('n', '<Leader>h', function()
   if vim.v.hlsearch == 1 and vim.o.hlsearch then
      vim.o.hlsearch = false
   else
      vim.opt.hlsearch = true
   end
end, { desc = 'Toggle Highlight' })

