local core = os.getenv("LOCALAPPDATA") .. "/nvim/lua/lazy/config/core/"

local treesitter = {
    "nvim-treesitter/nvim-treesitter",
    event = "VimEnter",
    build = ":TSUpdate",
    dependencies = {"JoosepAlviste/nvim-ts-context-commentstring"},
    config = function()
        local treesitter = require(core .. "_treesitter.lua")
        require("nvim-treesitter.configs").setup({
            treesitter.config
        })
    end,
}

local telescope = {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    event = "VimEnter",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzf-native.nvim"
    },
    config = function()
        local telescope = require(core .."/_telescope")
        telescope.config()
        telescope.fzf()
    end,
}

local cmp = {
    "hrsh7th/cmp-nvim-lsp",
    event = "VimEnter",
    dependencies = {
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-cmdline",
        "neovim/nvim-lspconfig",
        "onsails/lspkind.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require(core .. "_cmp")
    end,
}

local luasnip = {
    "L3MON4D3/LuaSnip",
    event = "BufNew",
    build = "make install_jsregexp",
}

local gitsigns = {
    "lewis6991/gitsigns.nvim",
    event = "BufNew",
    config = function()
        require("gitsigns").setup()
    end,
}

local term = {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
        require(core .."_term").opts
    },
}

local dap = {
    "mfussenegger/nvim-dap",
    lazy = true,
}

local dap_ui = {
    "rcarriga/nvim-dap-ui",
    event = "VimEnter",
    dependencies = {
        "mfussenegger/nvim-dap",
    },
}

local table = {
    {treesitter},
    {cmp},
    {luasnip},
    {telescope},
    {gitsigns},
    {term},
    {dap},
    {dap_ui},
}

return table
