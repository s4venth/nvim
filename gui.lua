return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VimEnter",
        config = function()
            require("lualine").setup({
                options = {
                    theme = 'auto',
                    component_separators = {left = '-', right = '-'},
                    section_separators = {left = '', right = ''},
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                        NvimTree = {},
                    },
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
        end,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

    {
        "akinsho/bufferline.nvim",
        enabled = true,
        event = "BufNew",
        config = function()
            vim.opt.termguicolors = true
            require("bufferline").setup{
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
                }
            }
        end,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("alpha").setup(require("alpha.themes.startify").config)
        end,
    },

    {
        "SmiteshP/nvim-navic",
        config = function ()
            require("nvim-navic").setup({
                lsp = {
                    auto_attach = true,
                },
                safe_output = true,
            })
        end,
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },

    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        init = function()
            require("nvim-tree").setup({
                auto_reload_on_write = true,
                sort_by = "filetype",
            })
        end,
    },
}
