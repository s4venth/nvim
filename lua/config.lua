local M = {}

---Attaches nvim-navic to LSP running in current buffer
---@param client string
---@param bufnr number
local on_attach = function (client, bufnr)
  local navic = require("nvim-navic")
  if client.server_capabilities.documentSymbolProvider then ---@diagnostic disable-line: undefined-field
    navic.attach(client, bufnr)
  end
end

---If current buffer has a LSP running returns "LSP: <name>", if not returns "No Active Lsp"
---@return string
local function lsp_name()
  local msg = 'No Active Lsp'
  local buf_ft = vim.api.nvim_get_option_value('filetype', {buf = 0})
  local clients = vim.lsp.get_clients({bufnr = 0})

  if next(clients) == nil then return msg end

  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes ---@diagnostic disable-line: undefined-field
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return "  " .. client.name
    end
  end
  return msg
end

function M.minimal()
  return {}
end

function M.mellifluous()
  return {
    color_set = 'tender',
    styles = {
      conditionals = {bold = true},
      keywords = {bold = true},
      booleans = {bold = true},
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
    }
end

function M.catppuccin()
  return {
    flavour = "mocha",
    integrations = {
      mason = true,
      navic = { enabled = true, custom_bg = "NONE" },
      illuminate = true,
      nvimtree = true,
      treesitter = true,
      which_key = false,
    },
    no_italic = true,
  }
end

function M.mason()
  return {
    ensure_installed = {
      "lua_ls",
      "rust_analyzer",
      "clangd",
    },
  }
end

function M.treesitter()
  local configs = require("nvim-treesitter.configs")
  local ts_utils = require("nvim-treesitter.utils")
  configs.setup({
    auto_install = false,
    modules = {},
    ignore_install = {},
    ensure_installed = {"c", "rust", "lua", "vim", "vimdoc", "css", "json"},
    sync_install = false,
    highlight = {enable = true},
    indent = {enable = true},
  })
end

function M.telescope()
  require('telescope').setup ({
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      }
    }
  })
  require('telescope').load_extension('fzf')
end

---@diagnostic disable: missing-fields
function M.cmp()
  local cmp = require('cmp')
  local cmp_select = { behavior = cmp.SelectBehavior.select }
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
          mode = "symbol_text",
          maxwidth = 25,
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
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      },
        {{ name = 'buffer' }}
      ),
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
end

function M.cmp_nvim_lsp()
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  ---Takes a LSP client and a table of options for it, merges it with the defaults, and then calls setup
  ---@param client string
  ---@param opts table?
  local function lsp_setup(client, opts)
    local settings = {
      capabilities = capabilities,
      on_attach = on_attach,
    }
    if opts ~= nil then
      for option, value in pairs(opts) do
        settings[option] = value
      end
    end
    require('lspconfig')[client].setup(settings)
  end

  lsp_setup('clangd')
  lsp_setup('pyright')
  lsp_setup('lua_ls', {
    on_attach = on_attach,
    asettings = {
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
    server = {
      on_attach = on_attach,
    },
    settings = {
      ['rust_analyzer'] = {}
    }
  })
  lsp_setup('bashls')
  lsp_setup('asm_lsp')
  lsp_setup('hls', {
    settings = {
      haskell = {
        formattingProvider = "stylish-haskell",
        plugin = {
          stan = { globalOn = false }
        }
      }
    }
  })
  lsp_setup('zls')
  lsp_setup('cssls')
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

---Returns a hard-coded lualine colorscheme
---If not found, returns 'auto' which is the default
---@return table|string
local custom_theme = function()
  local colors = require("catppuccin.palettes").get_palette "mocha"
  if colors == nil then
    return 'auto'
  end
  local set = {
    normal = {
      a = { bg = colors.blue,     fg = colors.base,     gui = 'bold' },
      b = { bg = colors.surface0, fg = colors.text },
      c = { bg = colors.base,     fg = colors.text }
    },
    insert = {
      a = { bg = colors.green,    fg = colors.base,     gui = 'bold' },
      b = { bg = colors.surface0, fg = colors.text },
      c = { bg = colors.base,     fg = colors.text }
    },
    visual = {
      a = { bg = colors.yellow,   fg = colors.base,     gui = 'bold' },
      b = { bg = colors.surface0, fg = colors.text },
      c = { bg = colors.base,     fg = colors.text }
    },
    replace = {
      a = { bg = colors.red,      fg = colors.base,     gui = 'bold' },
      b = { bg = colors.surface0, fg = colors.text },
      c = { bg = colors.base,     fg = colors.text }
    },
    command = {
      a = { bg = colors.peach,    fg = colors.base,     gui = 'bold' },
      b = { bg = colors.surface0, fg = colors.text },
      c = { bg = colors.base,     fg = colors.text }
    },
    inactive = {
      a = { bg = colors.base,     fg = colors.surface1, gui = 'bold' },
      b = { bg = colors.base,     fg = colors.surface1 },
      c = { bg = colors.base,     fg = colors.surface1 }
    }
  }
  return set
end

function M.lualine()
  return {
    options = {
      theme = custom_theme,
      component_separators = false,
      section_separators = { left = '', right = '' },
      globalstatus = true,
      always_divide_middle = false,
      disabled_filetypes = {
        statusline = {},
        winbar = {},
        NvimTree = {},
        terminal = {},
      }
    },
    sections = {
      lualine_a = {
        { 'mode', separator = { left = "", right = "" } }
      },
      lualine_b = {
        { 'filetype', icon_only = true, padding = { left = 1, right = 0 } },
        { 'filename', path = 0 },
      },
      lualine_c = {
        { 'branch' },
        { 'diff' },
        { 'navic', color_correction = nil },
      },
      lualine_x = {
        { 'searchcount' },
        { 'selectioncount' },
        { 'diagnostics' },
        { lsp_name },
      },
      lualine_y = {
        { 'progress',padding = { left = 1, right = 1 } },
      },
      lualine_z = {
        { 'location', separator = { left = "", right = '' } }
      },
    },
    extensions = {
      'nvim-tree',
      'mason',
      'lazy',
      'trouble',
    }
  }
end

function M.bufferline()
  return {
    options = {
      mode = 'buffers',
      themable = true,
      numbers = "none",
      diagnostics = "nvim_lsp",
      close_command = "bdelete! %d",
      right_mouse_command = "bdelete! %d",
      left_mouse_command = "buffer %d",
      middle_mouse_command = nil,
      indicator = {
        icon = '| ',
        style = "none",
      },
      style_preset = {
        require("bufferline").style_preset.no_italic,
      },
      offsets = {
        { filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          separator = false,
        }
      },
      color_icons = false,
      separator_style = { ' ', ' ' },
    },
    highlights = {}
  }
end

function M.navic()
  return {
    highlight = true,
    lsp = {
      auto_attach = true,
    },
    safe_output = true,
  }
end

function M.alpha()
  return require("alpha.themes.theta").config
end

function M.Nvim_tree()
  return {
    view = {
      width = 25,
    },
    auto_reload_on_write = true,
    sort_by = "filetype",
    filters = {
      dotfiles = true,
      exclude = {
        ".local",
        ".config"
      }
    }
  }
end

---@diagnostic disable: redundant-parameter
function M.indent()
  return {
    scope = { enabled = false }
  }
end

function M.noice()
  return {
    cmdline = { view = "cmdline" },
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
    },
    presets = {
      lsp_doc_border = true, -- add a border to hover docs and signature help
    },
    notify = {
      enabled = true,
    }
  }
end

function M.notify()
  return {
    fps = 60,
    render = "compact",
  }
end

return M
