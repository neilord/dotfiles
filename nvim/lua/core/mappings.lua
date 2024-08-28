vim.g.mapleader = " "

vim.keymap.set("n", "U", vim.cmd.redo)

vim.keymap.set("n", "Y", "y$")

vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

vim.keymap.set("n", "<leader>q", "<cmd>qa<cr>", { desc = "Quit", silent = true })
vim.keymap.set("n", "<leader>Q", "<cmd>qa!<cr>", { desc = "Force Quit", silent = true })
vim.keymap.set("n", "<leader>sc", "<cmd>e $MYVIMRC | Neotree<cr>", { desc = "Config", silent = true })

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "x", '"_x')
vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "v" }, "<leader>Y", '"+y$')
vim.keymap.set({ "n", "v" }, "<leader>d", '"+d')
vim.keymap.set({ "n", "v" }, "<leader>D", '"+D')

-- toggle search highlight
vim.keymap.set("n", "<Leader>h", function()
    if vim.v.hlsearch == 1 and vim.o.hlsearch then
        vim.o.hlsearch = false
    else
        vim.opt.hlsearch = true
    end
end, { desc = "Toggle Highlight" })
