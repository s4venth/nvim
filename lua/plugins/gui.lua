local gui = require("plugins.configs.gui")

return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VimEnter",
        config = function()
            gui.lualine()
        end,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

    {
        "akinsho/bufferline.nvim",
        enabled = true,
        event = "BufNew",
        config = function()
            gui.bufferline()
        end,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            gui.alpha()
        end,
    },

    {
        "SmiteshP/nvim-navic",
        config = function()
            gui.navic()
        end,
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            gui.which_key()
        end,
        opts = {}
    },

    {
        "nvim-tree/nvim-tree.lua",
        event = "BufNew",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        init = function()
            gui.Nvim_tree()
        end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = "InsertEnter",
        config = function()
            gui.indent()
        end,
    },
}
