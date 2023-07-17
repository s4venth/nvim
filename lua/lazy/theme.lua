local minimal = {
    "Yazeed1s/minimal.nvim",
    enabled = false,
    priority = 1000,
    config = function()
        vim.cmd[[colorscheme minimal]]
    end,
}

local base16 = {
    "RRethy/nvim-base16",
    enabled = false,
    lazy = false,
    priority = 1000,
}

local mellifluous = {
    "ramojus/mellifluous.nvim",
    enabled = true,
    priority = 1000,
    config = function()
        local mellifluous = require("lazy/config/_mellifluous")
        mellifluous.config()
    end,
}

local catppuccin = {
    "catppuccin/nvim",
    enabled = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
        local catppuccin = require("lazy/config/_catppuccin")
        catppuccin.config()
    end,
}

table = {
    {minimal},
    {base16},
    {mellifluous},
    {catppuccin},
}

return table
