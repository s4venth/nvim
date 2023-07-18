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
        }
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "VimEnter",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        init = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.diagnostics.eslint,
                },
            })
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
        "neovim/nvim-lspconfig",
        lazy = true,
    },
}
