local config = require("config")
local M = {}

-- @gui
M.gui =  {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}
    },

    {
        "nvim-lualine/lualine.nvim",
        event = "VimEnter",
        config = function()
            config.lualine()
        end,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

    {
        "akinsho/bufferline.nvim",
        event = "BufNew",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function ()
            config.bufferline()
        end,
    },

    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            config.alpha()
        end,
    },

    {
        "SmiteshP/nvim-navic",
        config = function()
            config.navic()
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        lazy = true,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            config.Nvim_tree()
        end,
    },

    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        event = "BufNew",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {},
    },

    {
        "norcalli/nvim-colorizer.lua",
        event = "VeryLazy",
        config = function()
            require('colorizer').setup()
        end,
    },
}

-- @core
M.core = {
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VimEnter",
        build = ":TSUpdate",
        config = function()
            config.treesitter()
        end,
    },

    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },

    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
        },
        config = function()
            config.telescope()
        end,
    },

    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = 'make',
        lazy = true,
    },
}


-- @lsp
M.lsp =  {
    {
        "williamboman/mason.nvim",
        lazy = false,
        event = "VimEnter",
        config = function()
            require("mason").setup()
        end,
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "nvim-lua/lsp-status.nvim",
        }
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        lazy = true,
        event = "BufNew",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-cmdline",
            "onsails/lspkind.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            config.cmp()
        end
    },
    {
        "L3MON4D3/LuaSnip",
        event = "BufNew",
        version = "*",
        build = "make install_jsregexp",
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = true,
        dependencies = {
            "neovim/nvim-lspconfig",
        }
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "BufNew",
        config = function()
            require("gitsigns").setup()
        end,
    },
    {
        "folke/trouble.nvim",
        lazy = true,
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            require("trouble").setup()
        end,
    },
}

-- @deps
M.deps = {
    {
        "nvim-lua/plenary.nvim",
        lazy = true,
    },

    {
        "folke/neodev.nvim",
        lazy = true,
        opts = {},
    },

    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },
}



-- @themes
M.themes = {
    {
        "kdheepak/monochrome.nvim",
        lazy = true,
    },
    {
        "mcchrish/zenbones.nvim",
        lazy = true,
        dependencies = {
            "rktjmp/lush.nvim"
        },
    },

    {
        "Yazeed1s/minimal.nvim",
        lazy = true,
        config = function()
            vim.cmd[[colorscheme minimal-base16]]
        end
    },

    {
        "RRethy/nvim-base16",
        lazy = true,
    },

    {
        "ramojus/mellifluous.nvim",
        lazy = true,
        config = function()
            config.mellifluous()
        end
    },

    {
        "nyoom-engineering/oxocarbon.nvim",
        lazy = true,
        config = function()
            vim.cmd[[colorscheme oxocarbon]]
        end
    },

    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
        config = function()
            config.catppuccin()
        end
    },

    {
        "folke/tokyonight.nvim",
        lazy = true,
        config = function()
            vim.cmd[[colorscheme tokyonight-night]]
        end,
    }
}

return M
