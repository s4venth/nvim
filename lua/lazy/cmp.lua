local cmp = {
    "hrsh7th/cmp-nvim-lsp",
    event = "VimEnter",
    dependencies = {
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-cmdline",
        "neovim/nvim-lspconfig",
        "onsails/lspkind.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("lazy/config/_cmp")
    end,
}

local luasnip = {
    "L3MON4D3/LuaSnip",
    event = "BufNew",
    build = "make install_jsregexp",
}

local table = {
    {cmp},
    {luasnip},
}

return table
