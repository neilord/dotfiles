local fn = vim.fn

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local general = augroup("General", { clear = true })

autocmd("VimEnter", {
    callback = function(data)
        local directory = vim.fn.isdirectory(data.file) == 1
        if directory then
            vim.cmd.cd(data.file)
            vim.cmd("Telescope find_files")
        end
    end,
    group = general,
    desc = "Open Telescope when it's a directory",
})

autocmd("BufReadPost", {
    callback = function()
        if fn.line("'\"") > 1 and fn.line("'\"") <= fn.line("$") then
            vim.cmd('normal! g`"')
        end
    end,
    group = general,
    desc = "Go to the last cursor position",
})
