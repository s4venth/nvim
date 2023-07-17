local M = {}

function M.config()
    require("catppuccin").setup({
        flavour = "mocha",
        integrations = {
            mason = true,
            navic = {enabled = true},
            illuminate = true,
            which_key = true,
        },
    })
    vim.cmd[[colorscheme catppuccin]]
end

return M
