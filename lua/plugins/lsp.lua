local lsp = require("plugins.configs.lsp")

return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        event = "VimEnter",
        config = function()
            require("mason").setup()
        end,
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "nvim-lua/lsp-status.nvim",
        }
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        lazy = true,
        event = "VimEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-cmdline",
            "onsails/lspkind.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("plugins.configs.cmp")
        end
    },
    {
        "L3MON4D3/LuaSnip",
        event = "BufNew",
        version = "*",
        build = "make install_jsregexp",
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = true,
        dependencies = {
            "neovim/nvim-lspconfig",
        }
    },
    {
        "rcarriga/nvim-dap-ui",
        event = "BufNew",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "BufNew",
        config = function()
            require("gitsigns").setup()
        end,
    },
    {
        "folke/trouble.nvim",
        event = "VeryLazy",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            require("trouble").setup()
        end,
    },
}
