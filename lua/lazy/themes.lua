local themes = require("lazy/configs/themes_config")

return {
    {
        "Yazeed1s/minimal.nvim",
        enabled = false,
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd[[colorscheme minimal]]
        end
    },

    {
        "RRethy/nvim-base16",
        enabled = false,
        lazy = false,
        priority = 1000,
    },

    {
        "ramojus/mellifluous.nvim",
        enabled = true,
        lazy = false,
        priority = 1000,
        config = function()
            themes.mellifluous()
        end
    },

    {
        "nyoom-engineering/oxocarbon.nvim",
        enabled = false,
        config = function()
            vim.cmd[[colorscheme oxocarbon]]
        end
    },

    {
        "catppuccin/nvim",
        enabled = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            themes.catppuccin()
        end
    },

    {
        "folke/tokyonight.nvim",
        enabled = false,
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd[[colorscheme tokyonight-night]]
        end,
    }
}
