local config = require("config")
local M = {}

M.gui = {
  { "lukas-reineke/indent-blankline.nvim",
    event = "InsertEnter",
    main = "ibl",
    opts = config.indent
  },
  { "nvim-lualine/lualine.nvim",
    lazy = true,
    event = {"BufReadPre", "InsertEnter", "CmdlineEnter"},
    opts = config.lualine,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  { "akinsho/bufferline.nvim",
    event = "BufReadPre",
    opts = config.bufferline,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  { "goolord/alpha-nvim",
    lazy = false,
    opts = config.alpha,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  { "SmiteshP/nvim-navic",
    opts = config.navic,
  },
  { "nvim-tree/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    lazy = true,
    opts = config.Nvim_tree,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  { "norcalli/nvim-colorizer.lua",
    event = "VeryLazy",
    opts = {},
  },
  { "folke/noice.nvim",
    event = "VeryLazy",
    opts = config.noice,
    dependencies = {
      "MunifTanjim/nui.nvim",
      { "rcarriga/nvim-notify",
        config = function ()
            config.notify()
        end
      },
    }
  },
  {
    "sontungexpt/url-open",
    event = "VeryLazy",
    cmd = "URLOpenUnderCursor",
    opts = {}
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
    "karb94/neoscroll.nvim",
    opts = {}
  }
}

M.core = {
  { "nvim-treesitter/nvim-treesitter",
    event = "VimEnter",
    build = ":TSUpdate",
    init = function() config.treesitter() end,
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
    opts = {},
    dependencies = {
      { "williamboman/mason-lspconfig.nvim",
        lazy = true,
        dependencies = {
          "neovim/nvim-lspconfig",
        }
      },
      { "hrsh7th/cmp-nvim-lsp",
        lazy = true,
        init = function() config.cmp_nvim_lsp() end
      },
      { "nvim-lua/lsp-status.nvim" },
    }
  },
  { "hrsh7th/nvim-cmp",
    event = "VimEnter",
    init = function() config.cmp() end,
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
    opts = {},
  },
  { "folke/trouble.nvim", lazy = true,
    cmd = {"Trouble", "TroubleToggle"},
    opts = {},
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
  { "catppuccin/nvim", lazy = true, name = "catppuccin", opts = config.catppuccin },
  { "folke/tokyonight.nvim", lazy = true},
  { "nyoom-engineering/oxocarbon.nvim", lazy = true },
  { "ramojus/mellifluous.nvim",
    lazy = true,
    opts = config.mellifluous },
}

return M
