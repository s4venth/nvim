return {
    {
        "Yazeed1s/minimal.nvim",
        enabled = false,
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd[[colorscheme minimal]]
        end
    },

    {
        "RRethy/nvim-base16",
        enabled = false,
        lazy = false,
        priority = 1000,
    },

    {
        "ramojus/mellifluous.nvim",
        enabled = true,
        lazy = false,
        priority = 1000,
        config = function()
            require'mellifluous'.setup({
                color_set = 'mountain',
                mellifluous = {
                    neutral = false,
                    bg_contrast = 'hard'
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
    },

    {
        "nyoom-engineering/oxocarbon.nvim",
        enabled = false,
        config = function()
            vim.cmd[[colorscheme oxocarbon]]
        end
    },

    {
        "catppuccin/nvim",
        enabled = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
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
    },

    {
        "folke/tokyonight.nvim",
        enabled = false,
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd[[colorscheme tokyonight-night]]
        end,
    }
}
