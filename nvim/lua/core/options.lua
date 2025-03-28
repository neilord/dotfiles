vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.fillchars = { eob = " " }

vim.opt.termguicolors = true
vim.opt.guifont = "JetBrainsMono Nerd Font Mono:h16:e-subpixelantialias:#h-none"

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 8
vim.opt.updatetime = 50

vim.cmd([[let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"]])
vim.cmd([[let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"]])
