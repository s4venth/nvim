local lsp = "lazy/config/lsp/"

local mason = {
    "williamboman/mason.nvim",
    event = "VimEnter",
    config = function()
        local mason = require(lsp .."_mason")
        mason.config()
    end,
}

local null_ls = {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = true,
    init = function()
        local null_ls = require(lsp .."_null_ls")
        null_ls.init()
    end
}

local mason_cfg = {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
}

local lspconfig = {
    "neovim/nvim-lspconfig",
    lazy = true,
}

local table = {
    {mason},
    {null_ls},
    {mason_cfg},
    {lspconfig},
}

return table
