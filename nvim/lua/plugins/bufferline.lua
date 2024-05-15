return {
    'akinsho/bufferline.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        "nvim-tree/nvim-tree.lua",
    },
    commit = '*',

    event = 'BufReadPre',

    config = function()
        require('bufferline').setup({
            highlights = {
                buffer_selected = {
                    fg = '#a9b1d6',
                    italic = false,
                },
                separator = {
                    fg = '#5c628a',
                },
            },
            options = {
                show_buffer_close_icons = false,
                separator_style = { '|', '|' },
                indicator = {
                    style = 'none',
                },

                offsets = {
                    {
                        filetype = "NvimTree",
                        text="󰉋 Explorer",
                        highlight = "BufferLineBufferSelected",
                        separator = true,
                    },
                    {
                        filetype = "undotree",
                        text="󰋚 History",
                        highlight = "BufferLineBufferSelected",
                        separator = true,
                    },
                },
            },
        });

        vim.keymap.set('n', '<leader>bn', ':enew<CR>',                      { desc = 'New buffer' })
        vim.keymap.set('n', '<leader>bb', ':BufferLineCycleNext<CR>',       { desc = 'Next buffer', silent = true })
        vim.keymap.set('n', '<leader>bB', ':BufferLineCyclePrev<CR>',       { desc = 'Previous buffer', silent = true })
        vim.keymap.set('n', '<leader>bs', ':BufferLinePick<CR>',            { desc = 'Select buffer', silent = true })
        vim.keymap.set('n', '<leader>bm', ':BufferLineMoveNext<CR>',        { desc = 'Move buffer to next position', silent = true })
        vim.keymap.set('n', '<leader>bM', ':BufferLineMovePrev<CR>',        { desc = 'Move buffer to previous position', silent = true })
        vim.keymap.set('n', '<leader>bp', ':BufferLineTogglePin<CR>',       { desc = 'Toggle buffer pin', silent = true })

        vim.keymap.set('n', '<leader>b1', ':BufferLineGoToBuffer 1<CR>',    { desc = 'Go to buffer 1', silent = true })
        vim.keymap.set('n', '<leader>b2', ':BufferLineGoToBuffer 2<CR>',    { desc = 'Go to buffer 2', silent = true })
        vim.keymap.set('n', '<leader>b3', ':BufferLineGoToBuffer 3<CR>',    { desc = 'Go to buffer 3', silent = true })
        vim.keymap.set('n', '<leader>b4', ':BufferLineGoToBuffer 4<CR>',    { desc = 'Go to buffer 4', silent = true })
        vim.keymap.set('n', '<leader>b5', ':BufferLineGoToBuffer 5<CR>',    { desc = 'Go to buffer 5', silent = true })
        vim.keymap.set('n', '<leader>b6', ':BufferLineGoToBuffer 6<CR>',    { desc = 'Go to buffer 6', silent = true })
        vim.keymap.set('n', '<leader>b7', ':BufferLineGoToBuffer 7<CR>',    { desc = 'Go to buffer 7', silent = true })
        vim.keymap.set('n', '<leader>b8', ':BufferLineGoToBuffer 8<CR>',    { desc = 'Go to buffer 8', silent = true })
        vim.keymap.set('n', '<leader>b9', ':BufferLineGoToBuffer 9<CR>',    { desc = 'Go to buffer 9', silent = true })
        vim.keymap.set('n', '<leader>b0', ':BufferLineGoToBuffer 0<CR>',    { desc = 'Go to the last buffer', silent = true })

        vim.keymap.set('n', '<leader>bc', ':bdelete<CR>',                   { desc = 'Close buffer', silent = true })
        vim.keymap.set('n', '<leader>bC', ':BufferLineCloseOthers<CR>',     { desc = 'Close other buffers', silent = true })
        vim.keymap.set('n', '<leader>bS', ':BufferLinePickClose<CR>',       { desc = 'Pick and close buffer', silent = true })

        vim.keymap.set('n', '<leader>br', ':BufferLineSortByDirectory<CR>', { desc = 'Sort buffers by directory', silent = true })
        vim.keymap.set('n', '<leader>bR', ':BufferLineSortByExtension<CR>', { desc = 'Sort buffers by extension', silent = true })
    end,
}
