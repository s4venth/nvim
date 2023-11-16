local M = {}

-- @Mappings
function M.mappings()
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

-- @Settings
function M.settings()
    Nvim = {}
    Nvim.path = vim.fn.stdpath("config") .."/lua/"
    vim.opt.fillchars:append {eob = " "} -- Removes '~' from empty space
    vim.g.loaded_netrw = 1               -- These are required for Nvim-Tree to
    vim.g.loaded_netrwPlugin = 1         -- function correctll
    vim.opt.linespace = 0
    vim.o.guifont = "Hasklug Nerd Font Mono:h14"
    vim.o.autochdir = false              -- change dir when opening a new file
    vim.opt.wrap = false                 -- wrap long lines to next row 
    vim.opt.scrolloff = 9                -- how many lines from the cursor to begin scrolling

    vim.opt.tabstop = 4                  -- 4 space indenting
    vim.opt.shiftwidth = 4               -- tab -> 4 spaces
    vim.opt.expandtab = true             -- 

    vim.opt.hlsearch = false
    vim.opt.incsearch = true

    vim.opt.number = true                -- Line numbers
    vim.opt.relativenumber = true        -- relative to cursor
    vim.opt.guicursor = ""

    vim.opt.termguicolors = true         -- Required by many plugins

    vim.opt.undofile = true              -- Stores history into a file so you can undo edits from later sessions
    vim.opt.undodir = vim.fn.stdpath("data").."/undodir" -- Path of undofile
end

function M.powershell()
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

function M.all()
    M.mappings()
    M.settings()
end
return M
