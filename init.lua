----------------------------------------------------------------------
--- Default vim settings that are set even if something is broken. ---

Nvim = {}
Nvim.path = os.getenv("LOCALAPPDATA") .. "/nvim/lua/"
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

----------------------------------------------------------------------
---        Windows PowerShell configurations (windows only)        ---

if package.config:sub(1,1) == '\\' then
    require("powershell")
end

----------------------------------------------------------------------
---                  Neovide only configurations                   ---

if vim.cmd[[g:neovide]] then
    vim.cmd[[let g:neovide_profiler=v:false]]
    vim.cmd[[let g:neovide_scroll_animation_length=0]]
    vim.cmd[[let g:neovide_cursor_animation_length=0]]
    vim.cmd[[let g:neovide_transparency=1]]
    vim.cmd[[let g:neovide_fullscreen=v:false]]
end

----------------------------------------------------------------------
---                    Lazy.nvim configuration                     ---

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
require("lazy").setup("plugins")

----------------------------------------------------------------------
---                   Key Mappings configuration                   ---

vim.cmd[[:map <F2> :NvimTreeToggle $HOME<CR>]]
vim.cmd[[:map <F3> :ToggleTerm<CR>]]
vim.cmd[[:map <C-t> :Telescope<CR>]]
