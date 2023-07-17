local plenary = {
    "nvim-lua/plenary.nvim",
    lazy = true,
}

local neodev = {
    "folke/neodev.nvim",
    lazy = false,
    priority = 999,
}

local devicons = {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
}

local shim = {
    "equalsraf/neovim-gui-shim",
    lazy = false,
    priority = 1000,
}

table = {
    {plenary},
    {neodev},
    {devicons},
    {shim},
}

return table
