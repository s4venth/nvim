return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VimEnter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")
            local ts_utils = require("nvim-treesitter.utils")
            configs.setup({
                ensure_installed = {"c", "lua", "vim", "vimdoc"},
                sync_install = false,
                highlight = {enable = true},
                indent = {enable = true},
            })
        end,
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
    },

    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        lazy = true,
    },
}
