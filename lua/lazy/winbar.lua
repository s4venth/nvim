
local M = {}
local navic = require("nvim-navic")

local plugins = {
    "SmiteshP/nvim-navic",
    config = function ()
        navic.setup({
            lsp = {
                auto_attach = true,
            },
            safe_output = true,
        })
    end
}

return plugins
