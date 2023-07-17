return {
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
            require("lazy/configs/cmp-config")
        end
    },

    {
        "hrsh7th/cmp-buffer",
        lazy = true,
    },

    {
        "hrsh7th/cmp-path",
        lazy = true,
    },

    {
        "saadparwaiz1/cmp_luasnip",
        lazy = true,
    },

    {
        "L3MON4D3/LuaSnip",
        event = "BufNew",
        version = "*",
        build = "make install_jsregexp",
    },

    {
        "hrsh7th/nvim-cmp",
        lazy = true,
    },

    {
        "onsails/lspkind.nvim",
        lazy = true,
    },

}
