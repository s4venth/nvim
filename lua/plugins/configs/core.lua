local M = {}

function M.treesitter()
    local configs = require("nvim-treesitter.configs")
    local ts_utils = require("nvim-treesitter.utils")
    configs.setup({
        ensure_installed = {"c", "lua", "vim", "vimdoc"},
        sync_install = false,
        highlight = {enable = true},
        indent = {enable = true},
    })
end

function M.term()
    require("toggleterm").setup({
        shade_terminals = true,
        shading_factor = 2,
        direction = 'horizontal',
        winbar = {
            enabled = false,
        }
    })
end

function M.telescope()
    require('telescope').setup ({
        extensions = {
            fzf = {
                fuzzy = true,
            }
        }
    })
    require('telescope').load_extension('fzf')
end

return M
