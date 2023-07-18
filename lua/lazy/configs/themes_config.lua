local M = {}

function M.mellifluous()
    require'mellifluous'.setup({
        color_set = 'mountain',
        mellifluous = {
            neutral = false,
            bg_contrast = 'hard',
        },
        transparent_background = {
            enabled = false,
            telescope = false,
        },
        plugins = {
            cmp = true,
            gitsigns = true,
            nvim_tree = {
                enabled = true,
                show_root = true,
            },
            telescope = {
                enabled = true,
                nvchad_like = false,
            },
        },
    })
    vim.cmd[[colorscheme mellifluous]]
end

function M.catppuccin()
    require("catppuccin").setup({
        flavour = "mocha",
        integrations = {
            mason = true,
            navic = { enabled = true},
            illuminate = true,
            which_key = true,
        },
    })
    vim.cmd[[colorscheme catppuccin]]
end

return M
