local function lsp_name()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then 
        return msg
    end

    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return "Active Lsp: " .. client.name
        end
    end
    return msg
end

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
                ToggleTerm = {},
            }
        },
        sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {
                    {
                        "navic",
                        color_correction = "static",
                        navic_opts = {
                            highlight = true,
                        }
                    }
                },
                lualine_x = {lsp_name},
                lualine_y = {'filetype'},
                lualine_z = {'location', 'progress'},
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
                icon = ' ',
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
    require("alpha").setup(require("alpha.themes.theta").config)
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
