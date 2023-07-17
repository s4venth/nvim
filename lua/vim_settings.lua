-- using vim.cmd[[]] for compability reasons 
-- only used for old stuff
vim.cmd[[set tabstop=4]]
vim.cmd[[set shiftwidth=4]]
vim.cmd[[set expandtab]]
vim.cmd[[set number]]
vim.cmd[[set termguicolors]]

-- this removes the "~" characters in empty lines
vim.opt.fillchars:append {eob = " "}
vim.opt.linespace = 0

-- this is for Nvim-Tree to work correctly
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.guifont = "Cousine Nerd Font Mono:h12"

-- changes main dir to the opened files
vim.o.autochdir = true

-- For winbar with nvim-navic
vim.o.winbar = "%{%v:lua.vim.fn.expand('%F')%} %{%v:lua.require'nvim-navic'.get_location()%}"


