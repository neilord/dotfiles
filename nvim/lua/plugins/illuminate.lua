return {
    'RRethy/vim-illuminate',

    event = 'BufReadPre',

    config = function()
        require('illuminate').configure({
            delay = 300,
            filetypes_denylist = {
                'dirbuf',
                'dirvish',
                'fugitive',
                'NvimTree',
                'undotree',
            },
        })
    end,
}
