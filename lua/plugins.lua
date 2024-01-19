local config = require("config")
local M = {}

M.gui =  {
  { "lukas-reineke/indent-blankline.nvim",
    event = "InsertEnter",
    main = "ibl",
    opts = {}
  },
  { "nvim-lualine/lualine.nvim",
    lazy = true,
    event = {"BufReadPre", "InsertEnter", "CmdlineEnter"},
    config = function() config.lualine() end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  { "akinsho/bufferline.nvim",
    event = "BufReadPre",
    config = function() config.bufferline () end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  { "goolord/alpha-nvim",
    lazy = false,
    config = function() config.alpha() end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  { "SmiteshP/nvim-navic",
    config = function() config.navic() end,
  },
  { "nvim-tree/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    lazy = true,
    config = function() config.Nvim_tree() end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  { "norcalli/nvim-colorizer.lua",
    event = "VeryLazy",
    config = function() require('colorizer').setup() end,
  },
}

M.core = {
  { "nvim-treesitter/nvim-treesitter",
    event = "VimEnter",
    build = ":TSUpdate",
    config = function() config.treesitter() end,
  },
  { "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    cmd = "Telescope",
    lazy = true,
    config = function() config.telescope() end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim",
        build = 'make',
        lazy = true
      }
    },
  },
}

M.lsp = {
  { "williamboman/mason.nvim",
    lazy = false,
    priority = 900,
    config = function() require("mason").setup() end,
    dependencies = {
      { "williamboman/mason-lspconfig.nvim",
        lazy = true,
        dependencies = {
          "neovim/nvim-lspconfig",
        }
      },
      { "hrsh7th/cmp-nvim-lsp",
        lazy = true,
        config = function() config.cmp_nvim_lsp() end
      },
      { "nvim-lua/lsp-status.nvim" },
    }
  },
  { "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function() config.cmp() end,
    dependencies = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "L3MON4D3/LuaSnip",
        lazy = true,
        version = "*",
        build = "make install_jsregexp",
      },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-cmdline" },
      { "onsails/lspkind.nvim" },
    }
  },
  { "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  { "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function() require("gitsigns").setup() end,
  },
  { "folke/trouble.nvim", lazy = true,
    cmd = {"Trouble", "TroubleToggle"},
    config = function() require("trouble").setup() end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}

M.deps = {
  { "nvim-lua/plenary.nvim", lazy = true },
  { "folke/neodev.nvim", lazy = true, opts = {} },
  { "nvim-tree/nvim-web-devicons", lazy = true},
}

M.themes = {
  { "kdheepak/monochrome.nvim", lazy = true },
  { "Yazeed1s/minimal.nvim", lazy = true },
  { "RRethy/nvim-base16", lazy = true },
  { "catppuccin/nvim", lazy = true, name = "catppuccin" },
  { "folke/tokyonight.nvim", lazy = true},
  { "nyoom-engineering/oxocarbon.nvim", lazy = true },
  { "ramojus/mellifluous.nvim",
    lazy = true,
    config = function() config.mellifluous() end },
}

return M
