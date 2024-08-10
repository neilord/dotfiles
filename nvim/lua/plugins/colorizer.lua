return {
    "NvChad/nvim-colorizer.lua",

    opts = {
        { "*", "!lazy" },
        {
            user_default_options = {
                RRGGBBAA = true,
                AARRGGBB = true,
                css = true,
                tailwind = true,
                names = false,
            },
        },
    },
}
