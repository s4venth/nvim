---@diagnostic disable: unused-function
---@diagnostic disable: unused-local
local M = {}


local on_attach = function (client, bufnr)
    local navic = require("nvim-navic")
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end

local function lsp_name() -- lifted from evil_lualine
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
        return msg
    end

    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return "LSP: " .. client.name
        end
    end
    return msg
end

function M.minimal()
    require("minimal").setup({})
    vim.cmd("colorscheme minimal")
end

function M.mellifluous()
    require'mellifluous'.setup({
        color_set = 'tender',
        styles = {
            comments = {},
            conditionals = {bold = true},
            folds = {},
            loops = {},
            functions = {},
            keywords = {bold = true},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {bold = true},
            properties = {},
            types = {},
            operators = {},
        },
        mellifluous = {
            neutral = true,
            bg_contrast = 'medium',
        },
        flat_background = {
            line_numbers = true,
            floating_windows = false,
            file_tree = false,
            status_line = true,
        },
        transparent_background = {
            enabled = false,
            telescope = false,
        },
        plugins = {
            cmp = true,
            gitsigns = true,
            nvim_tree = {
                enabled = true,
                show_root = true,
            },
            telescope = {
                enabled = true,
                nvchad_like = false,
            },
        },
    })
    vim.cmd[[colorscheme mellifluous]]
end

function M.catppuccin()
    require("catppuccin").setup({
        flavour = "mocha",
        integrations = {
            mason = true,
            navic = { enabled = true},
            illuminate = true,
            which_key = true,
        },
    })
    vim.cmd[[colorscheme catppuccin]]
end

function M.null_ls()
    require("null-ls").setup({
        sources = {
            --require("null-ls").builtins.formatting.stylua,
            --require("null-ls").builtins.diagnostics.eslint,
        },
    })
end

function M.rust_tools()
    require("rust-tools").setup({
        tools = {
            runnables = {
                use_telescope = true,
            }
        },
        inlay_hints = {
            auto = true,
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
        server = {
            on_attach = on_attach,
        },
    })
end

function M.mason()
    require("mason-lspconfig").setup({
        ensure_installed = {
            "lua_ls",
            "rust_analyzer",
            "clangd",
        },
    })
end
function M.treesitter()
    local configs = require("nvim-treesitter.configs")
    local ts_utils = require("nvim-treesitter.utils")
    configs.setup({
        auto_install = false,
        modules = {},
        ignore_install = {},
        ensure_installed = {"c", "lua", "vim", "vimdoc"},
        sync_install = false,
        highlight = {enable = true},
        indent = {enable = true},
    })
end

function M.term()
    require("FTerm").setup({
        border = "double",
    })
end

function M.telescope()
    require('telescope').setup ({
        extensions = {
            fzf = {
                fuzzy = true,
            }
        }
    })
    require('telescope').load_extension('fzf')
end

---@diagnostic disable: missing-fields
function M.cmp()
    local cmp = require('cmp')
    local cmp_select = {behavior = cmp.SelectBehavior.select}
    local lspkind = require('lspkind')
    cmp.setup({
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },
        border = {
            completion = true,
            documentation = true,
        },
        formatting = {
            format = lspkind.cmp_format({
                nvim_lsp = "[LSP]",
                nvim_lua = "[Lua]",
                luasnip = "[LuaSnip]",
                buffer = "[Buffer]",
            })
        },
        window = {
            documentation = cmp.config.window.bordered(),
            completion = cmp.config.window.bordered(),
        },
        mapping = {
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<Tab>'] = cmp.mapping.confirm({select = true}),
            ['<Down>'] = cmp.mapping.select_next_item(cmp_select),
            ['<Up>'] = cmp.mapping.select_prev_item(cmp_select),
        },
        sources = cmp.config.sources({
            {name = 'nvim_lsp_signature_help'},
            {name = 'path'},
            {name = 'nvim_lua'},
            {name = 'nvim_lsp'},
            {name = 'luasnip'},
            {name = 'buffer'}
        }),
    })

    cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
            {name = 'git'} }, {
            {name = 'buffer'},
        })
    })

    cmp.setup.cmdline({'/', '?'}, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            {name = 'buffer'}
        }
    })

    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            {name = 'path'} }, {
            {name = 'cmdline'}
        })
    })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    ---@param client string
    ---@param opts table
    local function lsp_setup(client, opts)
        local full = {
            capabilities = capabilities,
            on_attach = on_attach
        }
        for _,v in ipairs(opts) do
            table.insert(full, v)
        end
        require('lspconfig')[client].setup(full)
    end

    lsp_setup('clangd',{})
    lsp_setup('lua_ls', {
        on_attach = on_attach,
        settings = {
            Lua = {
                telemetry = {enable = false},
                workspace = {
                    library = {
                        vim.fn.expand "$VIMRUNTIME",
                        require("neodev.config").types(),
                        "${3rd}/luv/library"
                    }
                }
            }
        },
    })
    lsp_setup('rust_analyzer',{
        settings = {
            ['rust_analyzer'] = {
                capabilities = capabilities,
                on_attach = on_attach,
        }}
    })
    lsp_setup('bashls',{})
    lsp_setup('asm_lsp',{})
    lsp_setup('hls',{})
    lsp_setup('cssls',{})
    lsp_setup('gopls',{
        cmd = {'gopls'},
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            gopls = {
                experimentalPostfixCompletions = true,
                analyses = {
                    unusedparams = true,
                    shadow = true,
                },
                staticcheck = true,
            },
        },
        init_options = {
            usePlaceholders = true,
        }
    })
end

local function pad()
    return ' '
end
function M.lualine()
    require("lualine").setup({
        options = {
            theme = 'monochrome',
            component_separators = {left = '', right = ''},
            section_separators = {left = '', right = ''},
            globalstatus = true,
            always_divide_middle = true,
            disabled_filetypes = {
                statusline = {},
                winbar = {},
                NvimTree = {},
                terminal = {},
            }
        },
        sections = {
            lualine_a = {
                {
                    pad,
                    padding = 0,
                }
            },
            lualine_b = {
                {
                    'filetype',
                    icon_only = true,
                    padding = {left = 1, right = 0},
                },{
                    'filename',
                    path = 1,
                },
            },
            lualine_c = {
                'branch',
                'diff'
            },
            lualine_x = {
                {lsp_name},
                'diagnostics',
            },
            lualine_y = {
                {
                    'progress',
                    padding = {left = 1, right = 0},
                },
                'location'
            },
            lualine_z = {
                {pad,
                padding = 0,}
            },
        },
        inactive_sections = {
            lualine_a = {
                {pad}
            },
            lualine_b = {
                {
                    'filetype',
                    icon_only = true,
                },{
                    'filename',
                    path = 1,
                },
            },
            lualine_c = {
                'branch',
                'diff'
            },
            lualine_x = {
                {lsp_name},
                'diagnostics',
            },
            lualine_y = {
                'progress',
                'location'
            },
            lualine_z = {
                {pad}
            },
        },
        extensions = {
            'nvim-tree',
            'mason',
            'lazy',
            'trouble'
        }
    })
end
---@diagnostic disable: missing-fields
function M.bufferline()
    vim.opt.termguicolors = true
    require("bufferline").setup({
        options = {
            mode = 'buffers',
            themable = true,
            numbers = "none",
            close_command = "bdelete! %d",
            right_mouse_command = "bdelete! %d",
            left_mouse_command = "buffer %d",
            middle_mouse_command = nil,
            indicator = {
                icon = '| ',
                style = 'underline',
            },
            style_preset = {
                require("bufferline").style_preset.minimal,
            },
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "center",
                    separator = true,
                }
            },
            color_icons = false,
            separator_style = {'', ''},
        },
    })
end

function M.navic()
    require("nvim-navic").setup({
        lsp = {
            auto_attach = true,
        },
        safe_output = true,
    })
end

function M.alpha()
    require("alpha").setup(require("alpha.themes.theta").config)
end

function M.Nvim_tree()
    require("nvim-tree").setup({
        view = {
            width = 25,
        },
        auto_reload_on_write = true,
        sort_by = "filetype",
        filters = {
            dotfiles = true,
            custom = {
                "^.\\{-}\\.[cert]\\{3}$",
                "^.\\{-}\\.[key]\\{3}$",
                "^.\\{-}pass[word]\\{1,4}.\\{-}$"
            },
            exclude = {
                ".local",
                ".config"
            }
        }
    })
end

---@diagnostic disable: redundant-parameter
function M.indent()
    require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = true,
    }
end

return M
