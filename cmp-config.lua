local cmp = require'cmp'
local lspkind = require'lspkind'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    formatting = {
        format = lspkind.cmp_format({
            nvim_lsp = "[LSP]",
            nvim_lua = "[Lua]",
            luasnip = "[LuaSnip]",
            buffer = "[Buffer]",
        })
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({select = true}),
    }),
    sources = cmp.config.sources({
        {name = 'nvim_lsp',},
        {name = 'luasnip'}, }, {
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

local navic = require("nvim-navic")

local on_attach = function (client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end

local _capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['clangd'].setup {
    on_attach = on_attach,
    capabilities = _capabilities
}
require('lspconfig').lua_ls.setup({
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
require('lspconfig')['bashls'].setup {
    capabilities = _capabilities,
    on_attach = on_attach,
}
require('lspconfig')['rust_analyzer'].setup {
    capabilities = _capabilities,
    on_attach = on_attach,
}
require('lspconfig')['asm_lsp'].setup {
    capabilities = _capabilities,
    on_attach = on_attach,
}
