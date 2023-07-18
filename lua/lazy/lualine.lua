local L = {}
local lualine = require("lualine")

local options = {
    theme = 'auto',
    component_separators = {left = '', right = ''},
    section_separators = {left = '', right = ''},
    disabled_filetypes = {
        statusline = {},
        winbar = {},
        NvimTree = {},
    },
}

local build = {
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'},
    },
}

L.config = {
    lualine.setup({
        options,
        build,
    })
}
return L
