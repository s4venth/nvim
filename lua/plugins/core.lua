local core = require("plugins.configs.core")

return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VimEnter",
        build = ":TSUpdate",
        config = function()
            core.treesitter()
        end,
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
    },

    {
        "akinsho/toggleterm.nvim",
        event = "VeryLazy",
        config = function()
            core.term()
        end
    },

    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        event = "VimEnter",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
        },
        config = function()
            core.telescope()
        end,
    },

    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = 'make',
        lazy = true,
    },


}
