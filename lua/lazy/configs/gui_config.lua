local M = {}

function M.lualine()
    require("lualine").setup({
        options = {
            theme = 'auto',
            component_separators = {left = '', right = ''},
            section_separators = {left = '', right = ''},
            disabled_filetypes = {
                statusline = {},
                winbar = {},
                NvimTree = {},
            }
        },
        sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {'filename'},
                lualine_x = {'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'},
            },
        extensions = {'nvim-tree'}
    })
end

function M.bufferline()
    vim.opt.termguicolors = true
    require("bufferline").setup({
        options = {
            --highlights = require("catppuccin.groups.integrations.bufferline").get(),
            style_preset = {
                require("bufferline").style_preset.no_italic,
                require("bufferline").style_preset.no_bold
            },
            indicator = {
                icon = '@',
                style = 'icon',
            },
            diagnostics = "nvim_lsp",
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "center",
                    separator = true,
                }
            },
            separator_style = "thick",
        },
    })
end

function M.navic()
    require("nvim-navic").setup({
        lsp = {
            auto_attach = true,
        },
        safe_output = true,
    })
end

function M.alpha()
    require("alpha").setup(require("alpha.themes.startify").config)
end

function M.which_key()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
end

function M.Nvim_tree()
    require("nvim-tree").setup({
        auto_reload_on_write = true,
        sort_by = "filetype",
    })
end

function M.indent()
    require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = false,
    }
end

return M
