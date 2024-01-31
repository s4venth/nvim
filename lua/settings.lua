local M = {}

local mappings = function ()
    vim.g.mapleader = ","
    -- Pressing <F3> in normal mode loads and opens trouble.nvim
    vim.keymap.set('n', '<F3>', function () require("trouble").toggle() end, {silent = true})
    -- Pressing <F2> in normal mode loads and opens nvim-tree
    vim.keymap.set('n', '<F2>', function () require("nvim-tree.api").tree.toggle() end, {silent = true})
    -- Pressing <Ctrl> + <t> loads and opens telescope.nvim
    vim.keymap.set('n', '<C-t>', function () require("telescope.builtin").builtin() end, {silent = true})
    -- In visual mode, typing "J" moves your selected text down while not replacing anything else
    vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
    vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
end

local settings = function ()
    vim.g.loaded_netrw = 1               -- These are required for Nvim-Tree to
    vim.g.loaded_netrwPlugin = 1         -- function correctly

    vim.o.autochdir = false              -- change dir when opening a new file
    vim.o.completeopt = "menuone,noinsert,noselect"
    vim.o.shell = "zsh"

    vim.opt.fillchars:append {eob = " "} -- Removes '~' from empty space
    vim.opt.wrap = true                  -- wrap long lines to next row 
    vim.opt.scrolloff = 9                -- how many lines from the cursor to begin scrolling
    vim.opt.linespace = 0

    vim.opt.tabstop = 4                  -- 4 space indenting
    vim.opt.shiftwidth = 4               -- tab -> 4 spaces
    vim.opt.expandtab = true             -- 

    vim.opt.hlsearch = false
    vim.opt.incsearch = true

    vim.opt.number = true                -- Line numbers \
    vim.opt.relativenumber = true        -- relative to cursor

    vim.opt.guicursor = ""
    vim.opt.termguicolors = true         -- Required by many plugins

    vim.opt.undofile = true              -- Stores history into a file so you can undo edits from later sessions
    vim.opt.undodir = vim.fn.stdpath("data").."/undodir" -- Path of undofile

    vim.opt.title = true
    vim.opt.titlestring = 'nvim %t'

    vim.lsp.set_log_level("error")
    vim.g.zig_fmt_parse_errors = 0
end

local autocmd = function ()
    local augroup = vim.api.nvim_create_augroup
    local autocmd = vim.api.nvim_create_autocmd

    autocmd("BufEnter", { -- BufNew or BufAdd do not work properly with Alpha.nvim; first file entered does not envoke either
        desc = "Tells Neovim to treat .z80 files as nasm files (for TS highlighting)",
        pattern = "*",
        group = augroup("z80_to_nasm", {clear = true}),
        callback = function ()
            if vim.fn.expand("%:e") == "z80" then
                vim.cmd[[:set filetype=nasm]]
            end
        end
    })
end

local powershell = function ()
    local powershell_options = {
        shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
        shellcmdflag = "-noLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
        shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
        shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
        shellquote = "",
        shellxquote = "",
    }
    for option, value in pairs(powershell_options) do
        vim.opt[option] = value
    end
end

local list = {
    ['mappings']   = mappings,
    ['settings']   = settings,
    ['autocmd']    = autocmd,
    ['powershell'] = powershell
}

---Takes a table of strings and executes associated configurations
---@param table table
function M.enable(table)
    for _, value in pairs(table) do
        if list[value] ~= nil then
            list[value]()
        end
    end
end

return M
