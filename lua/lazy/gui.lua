local gui = "lazy/config/gui/"

local statusline = {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function ()
        local lualine = require(gui .."_lualine")
        require("lualine").setup({
            options = {lualine.options},
            sections = {lualine.sections},
            inactive_sections = {lualine.inactive_sections},
        })
    end
}

local tabline = {
    "akinsho/bufferline.nvim",
    event = "BufNew",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        local bufferline = require(gui .."_bufferline")
        require("bufferline").setup({
            options = {bufferline.options},
        })
    end
}

local navic = {
    "SmiteshP/nvim-navic",
    config = function()
        local navic = require(gui .."_nvim-navic")
        require("nvim-navic").setup({
            icons = {navic.icons},
            lsp = {navic.lsp},
            navic.misc,
        })
    end,
}

local files = {
    "nvim-tree/nvim-tree.lua",
    event = "VimEnter",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    init = function()
        local tree = require(gui .."_nvim-tree")
        require("nvim-tree").setup({
            tree.misc,
        })
    end,
}

local keyhelp = {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
}

local greeter = {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        require("alpha").setup(require("alpha.themes.startify").config)
    end,
}

local autopairs = {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
}

local indent = {
    "lukas-reineke/indent-blankline.nvim",
    event = "InsertEnter",
    config = function()
        require("indent_blankline").setup {
            show_current_context = true,
            show_current_context_start = false,
        }
    end,
}

local table = {
    {statusline},
    {tabline},
    {navic},
    {files},
    {keyhelp},
    {greeter},
    {autopairs},
    {indent},
}

return table
