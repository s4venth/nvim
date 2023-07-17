return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        event = "VimEnter",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
        },
        config = function()
            require('telescope').setup ({
                extensions = {
                    fzf = {
                        fuzzy = true,
                    }
                }
            })
            require('telescope').load_extension('fzf')
        end,
    },

    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = 'make',
        lazy = true,
    },
}
