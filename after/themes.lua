local themes = require("plugins.configs.themes")

return {
    {
        "Yazeed1s/minimal.nvim",
        lazy = true,
        config = function()
            vim.cmd[[colorscheme minimal]]
        end
    },

    {
        "RRethy/nvim-base16",
        lazy = true,
    },

    {
        "ramojus/mellifluous.nvim",
        lazy = true,
        config = function()
            themes.mellifluous()
        end
    },

    {
        "nyoom-engineering/oxocarbon.nvim",
        lazy = true,
        config = function()
            vim.cmd[[colorscheme oxocarbon]]
        end
    },

    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
        config = function()
            themes.catppuccin()
        end
    },

    {
        "folke/tokyonight.nvim",
        lazy = true,
        config = function()
            vim.cmd[[colorscheme tokyonight-night]]
        end,
    }
}
