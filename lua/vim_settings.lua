Nvim = {}
Nvim.path = vim.fn.stdpath("config") .."/lua/"
vim.cmd[[set tabstop=4]]
vim.cmd[[set shiftwidth=4]]
vim.cmd[[set expandtab]]
vim.cmd[[set number]]
vim.cmd[[set termguicolors]]
vim.opt.fillchars:append {eob = " "}
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.linespace = 0
vim.o.guifont = "Cousine Nerd Font Mono:h12"
vim.o.autochdir = true
vim.o.winbar = "%{%v:lua.vim.fn.expand('%F')%} %{%v:lua.require'nvim-navic'.get_location()%}"
