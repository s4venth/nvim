Nvim = {}
Nvim.path = vim.fn.stdpath("config") .."/lua/"

vim.cmd[[set tabstop=4]]
vim.cmd[[set shiftwidth=4]]
vim.cmd[[set expandtab]]
vim.cmd[[set number]]
vim.cmd[[set relativenumber]]
vim.cmd[[set termguicolors]]
vim.cmd[[set guicursor=]]

vim.opt.fillchars:append {eob = " "}
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.linespace = 0
vim.o.guifont = "Hasklug Nerd Font Mono:h14"
vim.o.autochdir = true

vim.cmd[[colorscheme mellifluous]]
