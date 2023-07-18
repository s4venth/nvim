return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = "InsertEnter",
        config = function()
            require("indent_blankline").setup {
                show_current_context = true,
                show_current_context_start = false,
            }
        end,
    },
}
