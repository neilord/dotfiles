return {
    -- 'gelguy/wilder.nvim',
    -- dependencies = {
    --     'roxma/nvim-yarp',
    --     'roxma/vim-hug-neovim-rpc',
    -- },
    --
    -- event = 'VeryLazy',
    --
    -- config = function()
    --     local wilder = require('wilder')
    --
    --     wilder.set_option('pipeline', {
    --         wilder.branch(
    --             wilder.cmdline_pipeline({
    --                 language = 'python',
    --                 fuzzy = 2,
    --                 set_pcre2_pattern = 1,
    --             }),
    --             wilder.python_search_pipeline({
    --                 pattern = wilder.python_fuzzy_pattern({
    --                     start_at_boundary = false,
    --                 }),
    --                 sorter = wilder.python_difflib_sorter({
    --                     start_at_boundary = false,
    --                 }),
    --                 engine = 're',
    --             })
    --         ),
    --     })
    --
    --     -- wilder.set_option('renderer', wilder.wildmenu_renderer({
    --     --     highlighter = wilder.basic_highlighter(),
    --     --     separator = ' · ',
    --     --     left = {' ', wilder.wildmenu_spinner(), ' '},
    --     --     right = {' ', wilder.wildmenu_index()},
    --     -- }))
    --
    --     local highlighters = {
    --         wilder.pcre2_highlighter(),
    --         wilder.lua_fzy_highlighter(),
    --     }
    --
    --     local popupmenu_renderer = wilder.popupmenu_renderer(
    --         wilder.popupmenu_border_theme({
    --             border = 'rounded',
    --             empty_message = wilder.popupmenu_empty_message_with_spinner(),
    --             highlighter = highlighters,
    --             left = {
    --                 ' ',
    --                 wilder.popupmenu_devicons(),
    --                 wilder.popupmenu_buffer_flags({
    --                     flags = ' a + ',
    --                     icons = {['+'] = '', a = '', h = ''},
    --                 }),
    --             },
    --             right = {
    --                 ' ',
    --                 wilder.popupmenu_scrollbar(),
    --             },
    --         })
    --     )
    --
    --     local wildmenu_renderer = wilder.wildmenu_renderer({
    --         highlighter = highlighters,
    --         separator = ' · ',
    --         left = {' ', wilder.wildmenu_spinner(), ' '},
    --         right = {' ', wilder.wildmenu_index()},
    --     })
    --
    --     wilder.set_option('renderer', wilder.renderer_mux({
    --         [':'] = popupmenu_renderer,
    --         ['/'] = wildmenu_renderer,
    --         ['?'] = wildmenu_renderer,
    --     }))
    --
    --     wilder.setup({
    --         modes = { ':', '/', '?', },
    --     })
    -- end,
}
