local mason = {
    "williamboman/mason.nvim",
    event = "VimEnter",
    config = function()
        local mason = require("lazy/config/_mason.lua")
        mason.config
    end,
}

local null_ls = {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = true,
    init = function()
        local null_ls = require("lazy/config/_null_ls.lua")
        null_ls.init
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
