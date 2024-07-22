return {
    'nvim-treesitter/nvim-treesitter-context',

    config = function()
        require('treesitter-context').setup()

        vim.api.nvim_set_hl(0, 'TreesitterContext', { bg = nil })
        vim.api.nvim_set_hl(0, 'TreesitterContextLineNumberBottom', { underline = true })
    end,
}
