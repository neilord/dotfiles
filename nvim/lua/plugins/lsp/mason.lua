return {
    "williamboman/mason.nvim",

    opts = {
        ui = {
            border = "rounded",
            width = 0.58, -- value making it looks similar to Lazy window
            height = 0.6,
        },
    },

    keys = {
        { "<leader>st", "<cmd>Mason<cr>", desc = "External Tools" },
    },
}
