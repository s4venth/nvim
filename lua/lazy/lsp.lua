local lsp = require("lazy/configs/lsp_config")

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
            "jose-elias-alvarez/null-ls.nvim",
            "nvim-lua/lsp-status.nvim",
        }
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "VimEnter",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        init = function()
            lsp.null_ls()
        end,
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
}
