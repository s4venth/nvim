local plugins = require("plugins")
local settings= require("settings")

settings.enable({
    'settings',
    'autocmd',
    'mappings'
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local spec = {
    plugins.gui,
    plugins.lsp,
    plugins.core,
    plugins.deps,
    plugins.themes
}

require("lazy").setup(spec)

vim.cmd[[colorscheme catppuccin]]
